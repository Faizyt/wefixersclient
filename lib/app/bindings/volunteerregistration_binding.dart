
import 'package:get/get.dart';
import '../controllers/volunteerregistration_controller.dart';


class VolunteerregistrationBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<VolunteerregistrationController>(() => VolunteerregistrationController());
  }
}