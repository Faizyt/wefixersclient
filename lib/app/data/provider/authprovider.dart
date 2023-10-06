import 'package:appwrite/appwrite.dart';
import 'package:appwrite/models.dart';
import 'package:get/get.dart';
import 'package:wefixers/app/data/services/appwrite/connection.dart';

class AuthProvider {
  AppWriteConnection appWriteConnection = AppWriteConnection();
  Future<bool> login(String email, String password) async {
    try {
      await appWriteConnection.account!
          .createEmailSession(email: email, password: password);
      return true;
    } on AppwriteException catch (e) {
      Get.snackbar("Error", e.message.toString());
      return false;
    }
  }

  // function to check if user is logged in or not
  isLoggedIn() async {
    try {
      await appWriteConnection.account!.get();
      Get.offAllNamed("/mainscreen");
      return true;
    } catch (e) {
      return false;
    }
  }

  // function to get user details
  Future userDetails() async {
    try {
      User user = await appWriteConnection.account!.get();
      return user;
    } catch (e) {
      // Get.snackbar("Error", e.message.toString());
    }
  }

  Future logout() async {
    try {
      await appWriteConnection.account!.deleteSessions();
      Get.offAllNamed("/login");
    } catch (e) {
      Get.snackbar("Error", e.toString());
    }
  }
}
