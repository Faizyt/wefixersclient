import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wefixers/app/ui/pages/signup_page/signup_page.dart';
import 'package:wefixers/app/ui/utils/colorconst.dart';
import '../../../controllers/login_controller.dart';
import '../../global_widgets/custombutton.dart';

class LoginPage extends GetView<LoginController> {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: LayoutBuilder(
          builder: (BuildContext context, BoxConstraints constraints) {
        return Column(
          children: [
            SingleChildScrollView(
              child: Container(
                height: constraints.maxHeight / 3.5,
                width: MediaQuery.of(context).size.width,
                decoration: const BoxDecoration(
                  shape: BoxShape.rectangle,
                  color: ColorConst.primaryColor,
                ),
                alignment: Alignment.center,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      "Please Sign in here ",
                      style: TextStyle(
                          fontSize: 30,
                          fontWeight: FontWeight.bold,
                          color: Colors.white),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Container(
                      height: 100,
                      width: 100,
                      decoration: const BoxDecoration(
                        shape: BoxShape.rectangle,
                        color: Colors.white,
                      ),
                      child: Image.asset(
                        "assets/images/wefixerslogo.png",
                        height: 100,
                        width: 100,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const SizedBox(
                    height: 20,
                  ),
                  CustomTextField(
                    hinttext: "Email",
                    controller: controller.emailController,
                    icon: Icons.email,
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  CustomTextField(
                    hinttext: "Password",
                    controller: controller.passwordController,
                    icon: Icons.lock,
                    // obscuretext: true,
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  CustomButton(
                    text: "Log in",
                    onPressed: () {
                      controller.login();
                    },
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  GestureDetector(
                    onTap: () {
                      Get.to(() => const SignupPage());
                    },
                    child: const Text(
                      "Don't have an account? Sign up",
                      style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                        color: Colors.deepPurple,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        );
      }),
    );
  }
}
