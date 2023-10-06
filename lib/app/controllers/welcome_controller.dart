import 'package:get/get.dart';
import 'package:wefixers/app/data/provider/authprovider.dart';

class WelcomeController extends GetxController {
  AuthProvider authProvider = AuthProvider();
  @override
  void onInit() {
    checkLogin();
    super.onInit();
    checkLogin();
  }

  @override
  void onReady() {
    checkLogin();
    super.onReady();
    checkLogin();
  }

  Future checkLogin() async {
    print("check login");
    await authProvider.isLoggedIn();
  }
}
