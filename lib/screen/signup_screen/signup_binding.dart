import 'package:get/get.dart';
import 'package:upwatch/screen/signup_screen/signup_controller.dart';

class SignupBinding implements Bindings {
  @override
  void dependencies() {
    Get.put<SignupController>(SignupController());
  }
}
