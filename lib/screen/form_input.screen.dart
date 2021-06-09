import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'home.viewmodel.dart';
import '../widgets/drop_down.dart';
import '../widgets/input_field.dart';
import '../widgets/spaces.dart';

// ignore: must_be_immutable
class FormInput extends ConsumerWidget {
  final firstName = TextEditingController();
  final lastName = TextEditingController();
  final phoneNumber = TextEditingController();
  final address = TextEditingController();

  String selectGender = "Choose Gender";
  @override
  Widget build(BuildContext context, watch) {
    final vm = watch(homeViewModel);
    return Scaffold(
      appBar: AppBar(
        title: Text("Enter details"),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              inputField(
                "First Name",
                controller: firstName,
              ),
              verticalSpace(),
              inputField(
                "Last Name",
                controller: lastName,
              ),
              verticalSpace(),
              CustomDropDown(
                selectedItem: selectGender,
              ),
              verticalSpace(),
              inputField(
                "Phone Number",
                controller: phoneNumber,
                keyboardType: TextInputType.phone,
              ),
              verticalSpace(),
              inputField(
                "Address",
                controller: address,
                isMultiline: true,
              ),
              verticalSpace(),
              MaterialButton(
                textColor: Colors.white,
                child: Center(child: Text("Save")),
                color: Theme.of(context).primaryColor,
                onPressed: () => vm.saveData(
                    firstName: firstName.text,
                    lastName: lastName.text,
                    selectGender: "$selectGender",
                    phoneNumber: phoneNumber.text,
                    address: address.text),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
