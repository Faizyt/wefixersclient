import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wefixers/app/ui/pages/signup_page/signup_page.dart';
import 'package:wefixers/app/ui/utils/colorconst.dart';
import '../../../controllers/login_controller.dart';
import '../../../routes/pages.dart';
import '../../global_widgets/custombutton.dart';

class LoginPage extends GetView<LoginController> {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: LayoutBuilder(
            builder: (BuildContext context, BoxConstraints constraints) {
          return Column(
            children: [
              Container(
                alignment: Alignment.center,
                height: constraints.maxHeight / 3.5,
                width: MediaQuery.of(context).size.width,
                decoration: const BoxDecoration(
                  shape: BoxShape.rectangle,
                  color: ColorConst.primaryColor,
                ),
                child: const Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                      height: 20,
                    ),
                    Icon(
                      Icons.connect_without_contact_outlined,
                      size: 50,
                      color: Colors.white,
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Text("Connect to our Social Worker's Team",
                        style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: Colors.white)),
                  ],
                ),
              ),
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
                  Get.toNamed(Pages.signup);
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
          );
        }),
      ),
    );
  }
}
