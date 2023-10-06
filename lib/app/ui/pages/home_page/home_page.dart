import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../controllers/home_controller.dart';

class HomePage extends GetView<HomeController> {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('HomePage'),
      ),
      body: SafeArea(
          child: Column(
        children: [
          FutureBuilder(
              future: controller.userDetails(),
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  return Text(snapshot.data!.name.toString());
                } else {
                  return const CircularProgressIndicator();
                }
              }),
          ElevatedButton(
            onPressed: () {
              controller.logOut();
            },
            child: Text('Login out '),
          ),
        ],
      )),
    );
  }
}
