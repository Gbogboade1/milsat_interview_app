import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

Function get err => () => Get.snackbar('Error Title', 'Failed: Change Theme');

void showErrorSnackbar(String title, String message) {
  showSnackbar(title, message, Icons.warning_amber_rounded,
      Theme.of(Get.context!).errorColor);
}

void showSuccessSnackbar(String title, String message) {
  showSnackbar(title, message, Icons.check_circle_outline_rounded,
      const Color(0xFF2FBC67));
}

void showSnackbar(
    String title, String message, IconData icon, Color backgroundColor) {
  Get.snackbar(
    title,
    message,
    backgroundColor: backgroundColor,
    duration: const Duration(seconds: 3),
    icon: Icon(
      icon,
      size: 36,
      color: Colors.white,
    ),
    snackStyle: SnackStyle.FLOATING,
    colorText: Colors.white,
    shouldIconPulse: false,
  );
}
