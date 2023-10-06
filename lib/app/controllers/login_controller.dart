import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wefixers/app/data/provider/authprovider.dart';
import 'package:wefixers/app/ui/global_widgets/customsnackbar.dart';

class LoginController extends GetxController {
  AuthProvider authProvider = AuthProvider();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  login() async {
    if (emailController.text.isEmail && passwordController.text.isNotEmpty) {
      final login = await authProvider.login(
          emailController.text.trim(), passwordController.text.trim());
      CustomSnackBar.getSuccessSnackBar("Login Success");
      if (login) {
        Get.offAllNamed("/mainscreen");
      }
    } else {
      CustomSnackBar.getSuccessSnackBar("Error: Please enter valid details");
    }
  }
}
