import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';

class CustomSnackBar {
  static const _successColor = Colors.green;
  static const _failedColor = Colors.red;

  static SnackBar getSuccessSnackBar(String message) {
    return SnackBar(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      duration: const Duration(seconds: 3),
      animation: CurvedAnimation(
          parent: const AlwaysStoppedAnimation(1), curve: Curves.easeInOut),
      content: Row(
        children: [
          const Icon(Icons.check_circle_outline, color: _successColor),
          const SizedBox(width: 8),
          Text('$message \u{1F64B}'),
        ],
      ),
      backgroundColor: _successColor.withOpacity(0.9),
    );
  }

  static SnackBar getFailedSnackBar(String message) {
    return SnackBar(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      animation: CurvedAnimation(
          parent: const AlwaysStoppedAnimation(1), curve: Curves.easeInOut),
      content: Row(
        children: [
          const Icon(Icons.error_outline, color: _failedColor),
          const SizedBox(width: 8),
          Text('$message \u{1F622}'),
        ],
      ),
      backgroundColor: _failedColor.withOpacity(0.9),
      duration: const Duration(seconds: 3),
    );
  }

  // getx snack bar
  static void getSuccessSnackBarX(String message) {
    Get.snackbar(
      "Success",
      message,
      snackPosition: SnackPosition.TOP,
      backgroundColor: _successColor.withOpacity(0.9),
      colorText: Colors.white,
      // icon: const Icon(Icons.check_circle_outline, color: _successColor),
      icon: Lottie.asset(
        'assets/animation/success.json',
        width: 30,
        height: 30,
        fit: BoxFit.cover,
      ),
      duration: const Duration(seconds: 3),
    );
  }

  static void getFailedSnackBarX(String message) {
    Get.snackbar(
      "Failed 👎",
      message,
      snackPosition: SnackPosition.BOTTOM,
      backgroundColor: _failedColor.withOpacity(0.9),
      colorText: Colors.white,
      icon: const Icon(Icons.error_outline, color: _failedColor),
      duration: const Duration(seconds: 3),
    );
  }
}
