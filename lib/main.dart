import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wefixers/app/data/provider/authprovider.dart';
import 'package:wefixers/app/routes/pages.dart';
import 'package:wefixers/app/ui/utils/colorconst.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      // onInit: () => AuthProvider().isLoggedIn(),
      getPages: Pages.pages,
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: ColorConst.primaryColor),
        useMaterial3: true,
      ),
      // initialRoute: Pages.welcome,
      initialRoute: Pages.voluntearRegister,
    );
  }
}
