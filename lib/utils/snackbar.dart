import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomSnackbar {
  static void showSnackbar({
    required String message,
    required String title,
    Color backgroundColor = Colors.red,
    Color textColor = Colors.white,
  }) {
    Get.snackbar(
      title,
      message,
      snackPosition: SnackPosition.BOTTOM,
      backgroundColor: backgroundColor,
      colorText: textColor,
    );
  }
}
