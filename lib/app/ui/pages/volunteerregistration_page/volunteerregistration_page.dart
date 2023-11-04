import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:wefixers/app/ui/global_widgets/custombutton.dart';
import 'package:wefixers/app/ui/pages/signup_page/signup_page.dart';
import '../../../controllers/volunteerregistration_controller.dart';
import '../../utils/colorconst.dart';

class VolunteerregistrationPage
    extends GetView<VolunteerregistrationController> {
  const VolunteerregistrationPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          // key: controller.scafoldkey,
          centerTitle: true,
          backgroundColor: ColorConst.primaryColor.withOpacity(1.0),
          title: const Text(
            'Register As A Volunteer',
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
              fontSize: 24,
              letterSpacing: 1.2,
              fontFamily: 'Montserrat',
            ),
          ),
          actions: <Widget>[
            IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.notifications,
                color: Colors.white,
                size: 28,
              ),
            ),
          ],
        ),
        body: Center(
          child: Obx(
            () => SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                // mainAxisSize: MainAxisSize.max,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const SizedBox(
                    height: 10,
                  ),
                  // image
                  Obx(
                    () => controller.image.value == null
                        ? GestureDetector(
                            onTap: () async {
                              await controller.pickImage();
                            },
                            child: const CircleAvatar(
                              radius: 50,
                              child: Icon(
                                Icons.person,
                                size: 30,
                              ),
                            ),
                          )
                        : CircleAvatar(
                            radius: 40,
                            backgroundImage: FileImage(controller.image.value!),
                          ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  CustomTextField(
                    readOnly: true,
                    controller: controller.nameController,
                    hinttext: "Name",
                    icon: Icons.person,
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  CustomTextField(
                    readOnly: true,
                    controller: controller.emailController,
                    errorText: controller.emailError.value,
                    hinttext: "Email",
                    icon: Icons.email,
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  CustomTextField(
                    onChanged: (value) {
                      controller.setPhone(value);
                    },
                    errorText: controller.phoneError.value,
                    hinttext: "Phone Number",
                    icon: Icons.phone,
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  CustomTextField(
                    onChanged: (value) {
                      controller.setCity(value);
                    },
                    errorText: controller.cityError.value,
                    hinttext: "City",
                    icon: Icons.location_city,
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  CustomTextField(
                    onChanged: (value) {
                      controller.setAddress(value);
                    },
                    errorText: controller.addressError.value,
                    hinttext: "Address",
                    icon: Icons.location_on,
                  ),

                  const SizedBox(
                    height: 10,
                  ),
                  CustomTextField(
                    onChanged: (value) {
                      controller.setFatherName(value);
                    },
                    errorText: controller.fatherNameError.value,
                    hinttext: "Father Name",
                    icon: Icons.person,
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  CustomTextField(
                    onChanged: (value) {
                      controller.setCnic(value);
                    },
                    errorText: controller.cnicError.value,
                    hinttext: "CNIC",
                    icon: Icons.credit_card,
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  CustomTextField(
                    onChanged: (value) {
                      controller.setEducation(value);
                    },
                    errorText: controller.educationError.value,
                    hinttext: "Education",
                    icon: Icons.school,
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  // add drop down widget
                  Container(
                    width: MediaQuery.of(context).size.width / 1.3,
                    padding:
                        const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(20),
                      border: Border.all(color: Colors.black.withOpacity(0.5)),
                    ),
                    child: DropdownButtonHideUnderline(
                      child: DropdownButton(
                        icon: const Icon(Icons.arrow_drop_down),
                        hint: const Text('Select Interest'),
                        value: controller.selectedIntrests.value,
                        items: controller.intrests,
                        onChanged: (newValue) {
                          controller.selectedIntrests.value =
                              newValue.toString();
                        },
                        // isExpanded: true,
                        style: const TextStyle(color: Colors.black),
                        dropdownColor: Colors.white,
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Obx(
                    () => controller.isLoading.value
                        ? Center(
                            child: Lottie.asset(
                            "assets/animation/loadingBar.json",
                            height: 100,
                            width: 100,
                          ))
                        : CustomButton(
                            text: "Register",
                            onPressed: () {
                              controller.submit();
                            },
                          ),
                  ),
                  const SizedBox(
                    height: 20,
                  )
                ],
              ),
            ),
          ),
        ));
  }
}
