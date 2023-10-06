import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wefixers/app/bindings/signup_binding.dart';
import 'package:wefixers/app/data/provider/authprovider.dart';
import 'package:wefixers/app/routes/pages.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {

    return GetMaterialApp(
      onInit: () => AuthProvider().isLoggedIn(),
      getPages: Pages.pages,
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      initialRoute: Pages.welcome,
    );
  }
}
