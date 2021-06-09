import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:get/get.dart';
import '../data/database/form_database.dart';
import '../widgets/error_snackbar.dart';

import 'dart:io';
import 'package:permission_handler/permission_handler.dart';

final homeViewModel = ChangeNotifierProvider((c) => HomeViewModel());

class HomeViewModel extends ChangeNotifier {
  var _db;
  HomeViewModel() {
    this._db = AppDatabase();
  }

  AppDatabase get db => _db;
  final context = Get.context!;

  String directoryPath = "/storage/emulated/0/milsat_csv";
  Future<String> getFilePath(uniqueFileName) async {
    final dir = Directory(directoryPath);

    if (!await dir.exists()) {
      await dir.create();
    }

    String path = '$directoryPath/$uniqueFileName';
    return path;
  }

  Future<String> _csvContent() async {
    var content = '';

    final list = await _db.getAllForms();

    for (var i in list) {
      final addr = '${i.address}'.replaceAll('\n', " ");
      content +=
          "${i.id},${i.firstName},${i.lastName},${i.gender ? 'Male' : 'Female'},${i.phoneNumber},$addr\n";
    }

    return content;
  }

  exportCsv() async {
    try {
      final fileName = "csv_${DateTime.now().microsecond}.csv"
          .toLowerCase()
          .replaceAll(" ", "");
      final fileDir = await getFilePath(fileName);

      final content = await _csvContent();
      final File file = File.fromUri(Uri.parse(fileDir));
      await file.writeAsString(content);

      showSuccessSnackbar("CSV Exported Successfully",
          "File ($fileName) is located in milsat_csv folder. ");
    } catch (e) {
      print("Error: $e");
    }
  }

  Future<bool> checkPermissions() async {
    var status = await Permission.storage.status;
    if (!status.isGranted) {
      // print("Request permision");
      await Permission.storage.request();
    }

    return status.isGranted;
  }

  saveData({
    required String firstName,
    required String lastName,
    required String phoneNumber,
    required String selectGender,
    required String address,
  }) async {
    print(selectGender);
    final phone = int.tryParse(phoneNumber);
    if (phone == null) {
      showErrorSnackbar("Phone Number Error", "Enter number");
      return;
    }

    await _db.insertForm(
      firstName: firstName,
      lastName: lastName,
      gender: "$selectGender" == "MALE" ? true : false,
      phoneNumber: phone,
      address: address,
    );

    Navigator.pop(context);
    showSuccessSnackbar("Add Data", "Success");
  }
}
