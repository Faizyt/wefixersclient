import 'package:appwrite/models.dart';
import 'package:get/get.dart';
import 'package:wefixers/app/data/provider/authprovider.dart';

class HomeController extends GetxController {
  final AuthProvider _authProvider = AuthProvider();

  Future<User> userDetails() async {
    var user = await _authProvider.userDetails();
    return user;
  }

  logOut() async {
    await _authProvider.logout();
  }
}
