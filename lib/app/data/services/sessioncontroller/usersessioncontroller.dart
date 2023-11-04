import 'package:appwrite/models.dart';

// class UserSessionController {
//   String? _userId;
//   String? _email;
//   String? _number;
//   Preferences? _prefers;
//   List<String>? _labels;
//   bool _isLoggedIn = false;
//   String? get userId => _userId;
//   String? get email => _email;
//   String? get number => _number;
//   Preferences? get prefers => _prefers;
//   List<String>? get labels => _labels;
//   bool get isLoggedIn => _isLoggedIn;

//   void login(String userId, String email, String number, Preferences prefers,
//       List<String> labels) {
//     _userId = userId;
//     _email = email;
//     _number = number;
//     _prefers = prefers;
//     _labels = labels;
//     _isLoggedIn = true;
//     // Add any additional login logic here
    
//   }

//   void logout() {
//     _userId = null;
//     _email = null;
//     _number = null;
//     _prefers = null;
//     _labels = null;
//     _isLoggedIn = false;
//     // Add any additional logout logic here
//   }
// }

class UserSessionController {
  static final UserSessionController _singleton = UserSessionController._internal();

  factory UserSessionController() {
    return _singleton;
  }

  UserSessionController._internal();

  String? _userId;
  String? _email;
  String? _number;
  Preferences? _prefers;
  List<String>? _labels;
  bool _isLoggedIn = false;

  String? get userId => _userId;
  String? get email => _email;
  String? get number => _number;
  Preferences? get prefers => _prefers;
  List<String>? get labels => _labels;
  bool get isLoggedIn => _isLoggedIn;

  void login(String userId, String email, String number, Preferences prefers, List<String> labels) {
    _userId = userId;
    _email = email;
    _number = number;
    _prefers = prefers;
    _labels = labels;
    _isLoggedIn = true;
    // Add any additional login logic here
  }

  void logout() {
    _userId = null;
    _email = null;
    _number = null;
    _prefers = null;
    _labels = null;
    _isLoggedIn = false;
    // Add any additional logout logic here
  }
}
