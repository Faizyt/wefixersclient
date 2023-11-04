import 'dart:io';

import 'package:appwrite/appwrite.dart';
// ignore: library_prefixes
import 'package:appwrite/models.dart' as UserModel;
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wefixers/app/data/provider/authprovider.dart';
import 'package:wefixers/app/data/services/appwrite/registrationforms.dart';
import '../data/services/globalservices/globalservices.dart';
import '../ui/global_widgets/customsnackbar.dart';

class VolunteerregistrationController extends GetxController {
  final AuthProvider _authProvider = AuthProvider();
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  var phone = '';
  var address = '';
  var city = '';
  var education = '';
  var fatherName = '';
  var cnic = '';
  var nameError = RxnString();
  var emailError = RxnString();
  var phoneError = RxnString();
  var addressError = RxnString();
  var cityError = RxnString();
  var educationError = RxnString();
  var fatherNameError = RxnString();
  var cnicError = RxnString();
  var isLoading = false.obs;
  RxList<DropdownMenuItem<String>> intrests =
      ['Education', 'Health', 'Food', 'Clothes', 'Shelter']
          .map<DropdownMenuItem<String>>((String value) {
            return DropdownMenuItem<String>(
              value: value,
              child: Text(value),
            );
          })
          .toList()
          .obs;
  RxString selectedIntrests = 'Education'.obs;
  UserModel.User? user;
  @override
  void onInit() {
    super.onInit();
    userdetails();
  }

  userdetails() async {
    user = await _authProvider.userDetails();
    nameController.text = user!.name;
    emailController.text = user!.email;
  }

  void setPhone(String value) {
    phone = value;
    if (value.isPhoneNumber) {
      phoneError.value = null;
    } else {
      phoneError.value = 'Enter a valid phone number';
    }
  }

  void setAddress(String value) {
    address = value;
    if (value.length >= 3) {
      addressError.value = null;
    } else {
      addressError.value = 'Address must be at least 3 characters';
    }
  }

  void setCity(String value) {
    city = value;
    if (value.length >= 3) {
      cityError.value = null;
    } else {
      cityError.value = 'City must be at least 3 characters';
    }
  }

  void setEducation(String value) {
    education = value;
    if (value.length >= 3) {
      educationError.value = null;
    } else {
      educationError.value = 'Education must be at least 3 characters';
    }
  }

  void setFatherName(String value) {
    fatherName = value;
    if (value.length >= 3) {
      fatherNameError.value = null;
    } else {
      fatherNameError.value = 'Father Name must be at least 3 characters';
    }
  }

  void setCnic(String value) {
    cnic = value;
    if (value.length >= 13) {
      cnicError.value = null;
    } else {
      cnicError.value = 'CNIC must be at least 13 characters';
    }
  }

  Rx<File?> image = Rx<File?>(null);
  Future<void> pickImage() async {
    GlobalServices.pickImageFromGallery().then((value) {
      if (value.path.isNotEmpty) {
        image.value = value;
      }
    });
  }

  submit() async {
    if (phone.isEmpty ||
        address.isEmpty ||
        city.isEmpty ||
        education.isEmpty ||
        fatherName.isEmpty ||
        cnic.isEmpty ||
        image.value == null) {
      isLoading.value = true;
      await Future.delayed(const Duration(seconds: 3));
      isLoading.value = false;
      CustomSnackBar.getFailedSnackBarX("Please fill all the fields");
    } else {
      isLoading.value = true;
      await Future.delayed(const Duration(seconds: 3));
      try {
        RegistrationForms registrationForms = RegistrationForms();
        registrationForms
            .registerVolunteer(
          user!.$id,
          emailController.value.text,
          nameController.value.text,
          phone,
          city,
          address,
          'interest',
          education,
          fatherName,
          cnic,
          image.value!.path,
        )
            .then((value) {
          Get.back();
          clearTextFields();

          isLoading.value = false;
          CustomSnackBar.getSuccessSnackBarX(
              "You have successfully registered as a volunteer");
        });
      } on AppwriteException catch (e) {
        Get.snackbar("Error", e.message.toString());
      }
    }
  }

  void clearTextFields() {
    phone = '';
    address = '';
    city = '';
    education = '';
    fatherName = '';
    cnic = '';
    nameError.value = null;
    emailError.value = null;
    phoneError.value = null;
    addressError.value = null;
    cityError.value = null;
    educationError.value = null;
    fatherNameError.value = null;
    cnicError.value = null;
    image.value = null;
  }
}
