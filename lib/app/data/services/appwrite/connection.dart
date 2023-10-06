import 'package:appwrite/appwrite.dart';
import 'package:get/get.dart';
import 'const/const.dart';

class AppWriteConnection {
  Client client = Client();
  Account? account;
  AppWriteConnection() {
    try {
      client
          .setEndpoint(AppwriteConst.endpointIP)
          .setProject(AppwriteConst.projectID)
          .setSelfSigned(status: true);
      account = Account(client);
    } catch (e) {
      Get.snackbar("Error", e.toString());
    }
  }
}
