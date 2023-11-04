import 'package:appwrite/appwrite.dart';
import 'package:wefixers/app/data/services/appwrite/connection.dart';
import 'package:wefixers/app/ui/global_widgets/customsnackbar.dart';

class AppwriteServices {
  final AppWriteConnection _appWriteConnection = AppWriteConnection();

  Future<bool> uploadImage(
      String fileID, String name, String bucketID, String path) async {
    final Storage storage = Storage(_appWriteConnection.client);
    try {
      await storage.createFile(
        bucketId: bucketID,
        fileId: fileID,
        file: InputFile.fromPath(
            path: path, filename: name, contentType: 'image/jpeg'),
      );
      return true;
    } on AppwriteException catch (e) {
      CustomSnackBar.getFailedSnackBar(e.message.toString());
      return false;
    }
  }
}
