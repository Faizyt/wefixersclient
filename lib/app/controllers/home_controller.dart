import 'package:appwrite/appwrite.dart';
import 'package:appwrite/models.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wefixers/app/data/database/voluntearregistration.dart';
import 'package:wefixers/app/data/provider/authprovider.dart';
import 'package:wefixers/app/data/services/globalservices/globalservices.dart';

import '../data/services/sessioncontroller/usersessioncontroller.dart';

class HomeController extends GetxController {
  final AuthProvider _authProvider = AuthProvider();
  var scafoldkey = GlobalKey<ScaffoldState>();
  var userDetails = Rxn<User>();
  late UserSessionController userSessionController;

  @override
  void onInit() async {
    super.onInit();
    userSessionController = UserSessionController();
    await userDetailsFn();
    userRegisterDetail();
  }

  userDetailsFn() async {
    var user = await _authProvider.userDetails();
    userDetails.value = user;
    userSessionController.login(
      userDetails.value!.$id,
      userDetails.value!.email,
      userDetails.value!.phone,
      userDetails.value!.prefs,
      [],
    );
    return user;
  }

  RxBool isVoluntear = false.obs;
  void userRegisterDetail() async {
    try {
      await RegistredVoluntear()
          .currentUserVoluntear(userSessionController.userId ?? "");
      isVoluntear.value = true;
    } on AppwriteException catch (e) {
      isVoluntear.value = false;
      AppLogger.log(e.message.toString());
    }
  }

  logOut() async {
    await _authProvider.logout();
    userSessionController.logout();
  }
}
