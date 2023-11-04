import 'package:get/get.dart';
import 'package:wefixers/app/bindings/home_binding.dart';
import 'package:wefixers/app/bindings/login_binding.dart';
import 'package:wefixers/app/bindings/profile_binding.dart';
import 'package:wefixers/app/bindings/signup_binding.dart';
import 'package:wefixers/app/bindings/volunteerregistration_binding.dart';
import 'package:wefixers/app/ui/pages/home_page/home_page.dart';
import 'package:wefixers/app/ui/pages/login_page/login_page.dart';
import 'package:wefixers/app/ui/pages/profile_page/profile_page.dart';
import 'package:wefixers/app/ui/pages/signup_page/signup_page.dart';
import 'package:wefixers/app/ui/pages/volunteerregistration_page/volunteerregistration_page.dart';

import '../ui/pages/welcome_page/welcome_page.dart';

class Pages {
  static const String login = '/login';
  static const String signup = '/signup';
  static const String welcome = '/welcome';
  static const String mainscreen = '/mainscreen';
  static const String profile = '/profile';
  static const String voluntearRegister = '/voluntearRegister';

  static var pages = [
    GetPage(
        name: login,
        page: () => const LoginPage(),
        binding: LoginBinding(),
        transition: Transition.zoom),
    GetPage(
        name: signup,
        page: () => const SignupPage(),
        binding: SignupBinding(),
        transition: Transition.zoom),
    GetPage(
        name: welcome,
        page: () => const WelcomePage(),
        binding: SignupBinding(),
        transition: Transition.upToDown),
    GetPage(
        name: mainscreen, page: () => const HomePage(), binding: HomeBinding()),
    GetPage(
        name: profile,
        page: () => const ProfilePage(),
        binding: ProfileBinding()),
    GetPage(
        name: voluntearRegister,
        page: () => const VolunteerregistrationPage(),
        binding: VolunteerregistrationBinding()),
  ];
}
