import 'package:appwrite/models.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wefixers/app/data/provider/authprovider.dart';

class HomeController extends GetxController {
  final AuthProvider _authProvider = AuthProvider();
  var scafoldkey = GlobalKey<ScaffoldState>();
  var checkUser = Rxn<User>();

  @override
  void onInit() {
    super.onInit();
    userDetails();
  }

  @override
  void onClose() {
    super.onClose();
    checkUser.close();
  }

  userDetails() async {
    var user = await _authProvider.userDetails();
    checkUser.value = user;
    return user;
  }

  logOut() async {
    await _authProvider.logout();
  }
}
