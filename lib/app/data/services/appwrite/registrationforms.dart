import 'package:appwrite/appwrite.dart';
import 'package:get/get.dart';
import 'package:wefixers/app/data/services/appwrite/appwriteglobal.dart';
import 'package:wefixers/app/data/services/appwrite/connection.dart';
import 'package:wefixers/app/data/services/appwrite/const/const.dart';

class RegistrationForms {
  final AppWriteConnection _appWriteConnection = AppWriteConnection();

  Future registerVolunteer(
    String id,
    String email,
  
    String name,
    String phoneNumber,
    String city,
    String address,
    String interest,
    String education,
    String fatherName,
    String cnic,
    String imagePath,
  ) async {
    Databases database = Databases(_appWriteConnection.client);
    try {
      await database.createDocument(
        collectionId: CollectionConst.voluntearRegistration,
        databaseId: DataBaseConst.voleantears,
        documentId: id,
        data: {
          "email": email,
          "name": name,
          "phone": phoneNumber,
          "city": city,
          "address": address,
          "interest": interest,
          "education": education,
          "fatherName": fatherName,
          "cnic": cnic,
        },
      );
      await AppwriteServices()
          .uploadImage(id, name, StorageConst.profileImages, imagePath);
    } on AppwriteException catch (e) {
      Get.snackbar("Error", e.message.toString());
    }
  }
}
