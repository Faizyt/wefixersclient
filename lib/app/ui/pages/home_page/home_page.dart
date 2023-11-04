import 'package:appwrite/models.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wefixers/app/data/services/globalservices/globalservices.dart';
import 'package:wefixers/app/ui/utils/colorconst.dart';
import '../../../controllers/home_controller.dart';
import '../../../data/services/sessioncontroller/usersessioncontroller.dart';

class HomePage extends GetView<HomeController> {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        key: controller.scafoldkey,
        centerTitle: true,
        backgroundColor: ColorConst.primaryColor.withOpacity(1.0),
        title: const Text(
          'Home Page',
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
      body: SafeArea(
          child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Obx(() => controller.userDetails.value != null
                ? Text(controller.userDetails.value!.name.toString())
                : const Text('Updating Data ...')),
            const SizedBox(
              height: 20,
            ),
            Obx(() => controller.isVoluntear.value
                ? const SizedBox()
                : ElevatedButton(
                    onPressed: () {
                      Get.toNamed('/voluntearRegister');
                    },
                    child: const Text('Resgister As A voluntear'),
                  )),
            ElevatedButton(
              onPressed: () {
                Get.toNamed('/profile');
              },
              child: const Text('Profile'),
            ),
            ElevatedButton(
              onPressed: () {
                controller.logOut();
              },
              child: const Text('Login out '),
            ),
          ],
        ),
      )),
    );
  }
}
