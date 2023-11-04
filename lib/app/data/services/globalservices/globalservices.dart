import 'dart:io';
import 'package:flutter/foundation.dart';
import 'package:image_picker/image_picker.dart';

class GlobalServices {
  // image picker from gallery
  static Future<File> pickImageFromGallery() async {
    final picker = ImagePicker();
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      return File(pickedFile.path);
    } else {
      return File('');
    }
  }
}

class AppLogger {
  static log(String? message) {
    if (!kReleaseMode) {
      if (kDebugMode) {
        print(message);
      }
    }
  }
}
