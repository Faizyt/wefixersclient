import 'package:appwrite/appwrite.dart';
import 'package:appwrite/models.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wefixers/app/data/provider/authprovider.dart';
import 'package:wefixers/app/data/services/appwrite/connection.dart';
import 'package:wefixers/app/data/services/appwrite/const/const.dart';
import 'package:wefixers/app/ui/global_widgets/customsnackbar.dart';

class ProfileController extends GetxController {
  TextEditingController nameController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController newPasswordController = TextEditingController();
  var checkUser = Rxn<User>();

  @override
  void onInit() {
    super.onInit();
    userVolunteerDetails();
  }

  Future userDetails() async {
    AuthProvider authProvider = AuthProvider();
    var user = await authProvider.userDetails();
    checkUser.value = user;
    return user;
  }

  Future userVolunteerDetails() async {
    AppWriteConnection appWriteConnection = AppWriteConnection();
    Databases database = Databases(appWriteConnection.client);
    final DocumentList documents = await database.listDocuments(
      collectionId: CollectionConst.voluntearRegistration,
      databaseId: DataBaseConst.voleantears,
    );
    print(documents.documents);
    return documents;
  }

  Future userImage(String id) async {
    AppWriteConnection appWriteConnection = AppWriteConnection();
    Storage storage = Storage(appWriteConnection.client);
    try {
      var file = await storage.getFileDownload(
        bucketId: StorageConst.profileImages,
        fileId: id,
      );
      return file;
    } on AppwriteException catch (e) {
      Get.snackbar("Error", e.message.toString());
    }
  }

  // update user details
  Future<void> updateUserName(String name, String id) async {
    AppWriteConnection appWriteConnection = AppWriteConnection();
    Account account = Account(appWriteConnection.client);
    // Storage storage = Storage(appWriteConnection.client);
    Databases database = Databases(appWriteConnection.client);
    try {
      await account.updateName(name: name);

      await database.updateDocument(
        collectionId: CollectionConst.voluntearRegistration,
        databaseId: DataBaseConst.voleantears,
        documentId: id,
        data: {
          "name": name,
        },
      );
      CustomSnackBar.getSuccessSnackBarX("Profile Phone Updated Successfully");
    } on AppwriteException catch (e) {
      Get.snackbar("Error", e.message.toString());
    }
    clearAll();
  }

  Future<void> updateUserPhone(String phone, String id, String password) async {
    AppWriteConnection appWriteConnection = AppWriteConnection();
    Account account = Account(appWriteConnection.client);
    Databases database = Databases(appWriteConnection.client);
    try {
      await account.updatePhone(password: password, phone: phone);
      await database.updateDocument(
        collectionId: CollectionConst.voluntearRegistration,
        databaseId: DataBaseConst.voleantears,
        documentId: id,
        data: {
          "phone": phone,
        },
      );
      CustomSnackBar.getSuccessSnackBarX("Profile Phone Updated Successfully");
    } on AppwriteException catch (e) {
      Get.snackbar("Error", e.message.toString());
    }
    clearAll();
  }

  // update user email
  Future<void> updateUserEmail(String email, String id, String password) async {
    AppWriteConnection appWriteConnection = AppWriteConnection();
    Account account = Account(appWriteConnection.client);
    Databases database = Databases(appWriteConnection.client);
    try {
      await account.updateEmail(password: password, email: email);

      await database.updateDocument(
        collectionId: CollectionConst.voluntearRegistration,
        databaseId: DataBaseConst.voleantears,
        documentId: id,
        data: {
          "email": email,
        },
      );
      CustomSnackBar.getSuccessSnackBarX("Profile Email Updated Successfully");
    } on AppwriteException catch (e) {
      Get.snackbar("Error", e.message.toString());
    }
    clearAll();
  }

  // update user password
  Future<void> updateUserPassword(
      String oldPassword, String id, String newPassword) async {
    AppWriteConnection appWriteConnection = AppWriteConnection();
    Account account = Account(appWriteConnection.client);
    try {
      await account.updatePassword(
          oldPassword: oldPassword, password: newPassword);
      CustomSnackBar.getSuccessSnackBarX(
          "Profile Password Updated Successfully");
    } on AppwriteException catch (e) {
      Get.snackbar("Error", e.message.toString());
    }
    clearAll();
  }

  clearAll() {
    nameController.clear();
    phoneController.clear();
    emailController.clear();
    passwordController.clear();
    newPasswordController.clear();
    checkUser.value = null;
    userDetails();
  }
}
