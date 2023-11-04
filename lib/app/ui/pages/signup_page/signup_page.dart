import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:wefixers/app/ui/global_widgets/custombutton.dart';
import '../../../controllers/signup_controller.dart';
import '../../utils/colorconst.dart';

class SignupPage extends GetView<SignupController> {
  const SignupPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: LayoutBuilder(
        builder: (context, constraints) {
          return Column(
            // mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Expanded(
                flex: 1,
                child: Container(
                  alignment: Alignment.center,
                  height: constraints.maxHeight / 4.5,
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
              ),
              Expanded(
                flex: 2,
                child: Container(
                  // height: constraints.maxHeight / 1.5,
                  width: MediaQuery.of(context).size.width,
                  decoration: const BoxDecoration(
                    shape: BoxShape.rectangle,
                    color: Colors.white,
                  ),
                  alignment: Alignment.center,
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        const SizedBox(
                          height: 15,
                        ),
                        CustomTextField(
                          hinttext: "Your Name",
                          icon: Icons.person,
                          controller: controller.nameController.value,
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        CustomTextField(
                          hinttext: "Email",
                          icon: Icons.email,
                          controller: controller.emailController.value,
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        CustomTextField(
                          hinttext: "Password",
                          icon: Icons.lock,
                          obscuretext: true,
                          controller: controller.passwordController.value,
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        Obx(
                          () => controller.isSignUp.value
                              ? Center(
                                  child: Lottie.asset(
                                  "assets/animation/loadingBar.json",
                                  height: 100,
                                  width: 100,
                                ))
                              : CustomButton(
                                  onPressed: () {
                                    controller.isSignUp.value = true;
                                    controller.signUp();
                                  },
                                  text: "Sign Up",
                                ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Text("Already have an account?"),
                            TextButton(
                              onPressed: () {
                                Get.offAllNamed("/login");
                              },
                              child: const Text("Log in"),
                            )
                          ],
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}

class CustomTextField extends StatelessWidget {
  final String hinttext;
  final IconData icon;
  final bool obscuretext;
  final TextEditingController? controller;
  final String? Function(String?)? validator;
  void Function(String)? onChanged;
  final String? errorText;
  final bool readOnly;

  CustomTextField({
    Key? key,
    this.hinttext = "",
    this.icon = Icons.person,
    this.obscuretext = false,
    this.controller,
    this.validator,
    this.onChanged,
    this.errorText,
    this.readOnly = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width / 1.3,
      child: TextFormField(
        obscureText: obscuretext,
        obscuringCharacter: "*",
        controller: controller,
        decoration: InputDecoration(
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20),
          ),
          hintText: hinttext,
          prefixIcon: Icon(icon),
          errorText: errorText,
        ),
        validator: validator,
        onChanged: onChanged,
        readOnly: readOnly,
      ),
    );
  }
}
