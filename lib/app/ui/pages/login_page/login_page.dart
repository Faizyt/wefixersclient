import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wefixers/app/ui/pages/signup_page/signup_page.dart';
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
            Container(
              height: constraints.maxHeight / 2,
              width: MediaQuery.of(context).size.width,
              decoration: const BoxDecoration(
                shape: BoxShape.rectangle,
                color: Colors.deepPurple,
              ),
              alignment: Alignment.center,
              child: const Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Please Sign in here ",
                    style: TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                        color: Colors.white),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  FlutterLogo()
                ],
              ),
            ),
            Container(
              height: constraints.maxHeight / 2,
              width: MediaQuery.of(context).size.width,
              decoration: const BoxDecoration(
                shape: BoxShape.rectangle,
                color: Colors.white,
              ),
              alignment: Alignment.center,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
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
                ],
              ),
            ),
          ],
        );
      }),
    );
  }
}
