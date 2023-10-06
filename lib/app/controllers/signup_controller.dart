import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wefixers/app/ui/utils/globalutils.dart';

class SignupController extends GetxController {
  Rx<TextEditingController> nameController = TextEditingController().obs;
  Rx<TextEditingController> emailController = TextEditingController().obs;
  Rx<TextEditingController> passwordController = TextEditingController().obs;
  Rx<TextEditingController> phoneNumber = TextEditingController().obs;
  Rx<TextEditingController> cityController = TextEditingController().obs;
  Rx<TextEditingController> addressController = TextEditingController().obs;
  Rx<TextEditingController> educationController = TextEditingController().obs;
  Rx<TextEditingController> fatherNameController = TextEditingController().obs;
  Rx<TextEditingController> cnicController = TextEditingController().obs;

  // Create an observable variable to store the selected value. 
  var selectedValue = 'Option 1'.obs;

  // A list of options for the dropdown menu.
  var dropdownItems = ['Option 1', 'Option 2', 'Option 3'];

  // Function to handle the selection change.
  void onDropdownChanged(String newValue) {
    selectedValue.value = newValue;
  }

  Rx<File?> image = Rx<File?>(null);
  profileImage() async {
    GlobalUtils.imagePicker().then((value) {
      image.value = value;
    });
  }

  void clearTextFields() {
    nameController.value.clear();
    emailController.value.clear();
    passwordController.value.clear();
    phoneNumber.value.clear();
    cityController.value.clear();
    addressController.value.clear();
    educationController.value.clear();
    fatherNameController.value.clear();
    cnicController.value.clear();
    image.value = null;
  }
}
