import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wefixers/app/routes/pages.dart';
import 'package:wefixers/app/ui/pages/signup_page/signup_page.dart';
import 'package:wefixers/app/ui/utils/colorconst.dart';
import '../../../controllers/welcome_controller.dart';
import '../../global_widgets/custombutton.dart';

class WelcomePage extends GetView<WelcomeController> {
  const WelcomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: LayoutBuilder(
            builder: (BuildContext context, BoxConstraints constraints) {
          return Column(
            children: [
              Container(
                height: constraints.maxHeight / 3,
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
                      "Welcome",
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
                    CustomButton(
                      text: "Log in",
                      onPressed: () {
                        Get.toNamed(Pages.login);
                      },
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    CustomButton(
                      text: "Sign up",
                      onPressed: () {
                        Get.toNamed(
                          Pages.signup,
                        );
                      },
                      colorofbutton: Colors.white,
                      coloroftext: Colors.black,
                    ),
                  ],
                ),
              ),
            ],
          );
        }),
      ),
    );
  }
}
