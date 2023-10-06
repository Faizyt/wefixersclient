import 'dart:io';
import 'package:image_picker/image_picker.dart';

class GlobalUtils {
  static Future<File> imagePicker() async {
    final picker = ImagePicker();
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      return File(pickedFile.path);
    } else {
      return File('');
    }
  }
}
