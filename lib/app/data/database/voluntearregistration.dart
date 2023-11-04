import 'package:appwrite/appwrite.dart';
import 'package:get/get.dart';
import 'package:wefixers/app/data/services/appwrite/connection.dart';

import '../services/appwrite/const/const.dart';

class RegistredVoluntear {
  Future listVoluntears() async {
    AppWriteConnection client = AppWriteConnection();
    Databases databases = Databases(client.client);
    try {
      final result = await databases.listDocuments(
          databaseId: DataBaseConst.voleantears,
          collectionId: CollectionConst.voluntearRegistration);
      return result;
    } catch (e) {
      Get.snackbar("Error", e.toString());
    }
  }

  Future currentUserVoluntear(String id) async {
    AppWriteConnection client = AppWriteConnection();
    Databases databases = Databases(client.client);
    try {
      final result = databases.getDocument(
          databaseId: DataBaseConst.voleantears,
          collectionId: CollectionConst.voluntearRegistration,
          documentId: id);
      return result;
    } catch (e) {
      Get.snackbar("Error", e.toString());
    }
  }
}
