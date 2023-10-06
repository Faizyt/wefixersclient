import 'package:flutter/material.dart';
import 'package:get/get.dart';
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
                      const SizedBox(
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
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        const SizedBox(
                          height: 10,
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
                          hinttext: "Phone Number",
                          icon: Icons.person,
                          controller: controller.phoneNumber.value,
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
                        CustomButton(
                            text: "Next",
                            onPressed: () {
                              showBottomSheet(
                                  context: context,
                                  builder: (context) {
                                    return Container(
                                      width: MediaQuery.of(context).size.width,
                                      decoration: const BoxDecoration(
                                        shape: BoxShape.rectangle,
                                        color: Colors.white,
                                      ),
                                      alignment: Alignment.center,
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          const Text(
                                            "Please Provide Some Additional Information",
                                            style: TextStyle(
                                                fontSize: 15,
                                                fontWeight: FontWeight.bold),
                                          ),
                                          const SizedBox(
                                            height: 10,
                                          ),
                                          // Upload Image
                                          Obx(
                                            () => controller.image.value == null
                                                ? GestureDetector(
                                                    onTap: () {
                                                      controller.profileImage();
                                                    },
                                                    child: const CircleAvatar(
                                                      radius: 50,
                                                      child: Icon(
                                                          Icons.add_a_photo),
                                                    ),
                                                  )
                                                : CircleAvatar(
                                                    radius: 50,
                                                    backgroundImage: FileImage(
                                                        controller
                                                            .image.value!),
                                                  ),
                                          ),
                                          const SizedBox(
                                            height: 10,
                                          ),
                                          CustomTextField(
                                            hinttext: "City",
                                            icon: Icons.person,
                                            controller:
                                                controller.cityController.value,
                                          ),
                                          const SizedBox(
                                            height: 10,
                                          ),
                                          CustomTextField(
                                            hinttext: "Address",
                                            icon: Icons.person,
                                            controller: controller
                                                .addressController.value,
                                          ),
                                          const SizedBox(
                                            height: 10,
                                          ),
                                          CustomTextField(
                                            hinttext: "Education",
                                            icon: Icons.person,
                                            controller: controller
                                                .educationController.value,
                                          ),
                                          const SizedBox(
                                            height: 10,
                                          ),
                                          CustomTextField(
                                            hinttext: "Father Name",
                                            icon: Icons.person,
                                            controller: controller
                                                .fatherNameController.value,
                                          ),
                                          const SizedBox(
                                            height: 10,
                                          ),
                                          CustomTextField(
                                            hinttext: "CNIC",
                                            icon: Icons.person,
                                            controller:
                                                controller.cnicController.value,
                                          ),
                                          const SizedBox(
                                            height: 10,
                                          ),
                                          // Drop Down for Intrest Area
                                          const Text(
                                              "Please Select Intrest Area"),
                                          Obx(() => DropdownButton<String>(
                                                value: controller
                                                    .selectedValue.value,
                                                items: controller.dropdownItems
                                                    .map((String value) {
                                                  return DropdownMenuItem<
                                                      String>(
                                                    value: value,
                                                    child: Text(value),
                                                  );
                                                }).toList(),
                                                onChanged: (newValue) {
                                                  controller.onDropdownChanged(
                                                      newValue!);
                                                },
                                              )),

                                          CustomButton(
                                            text: "Submit",
                                            onPressed: () {
                                              // controller.signup();
                                            },
                                            colorofbutton: Colors.white,
                                            coloroftext: Colors.black,
                                          ),
                                        ],
                                      ),
                                    );
                                  });
                            }),
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
  // add validator

  const CustomTextField({
    super.key,
    this.hinttext = "",
    this.icon = Icons.person,
    this.obscuretext = false,
    this.controller,
  });

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
        ),
      ),
    );
  }
}
