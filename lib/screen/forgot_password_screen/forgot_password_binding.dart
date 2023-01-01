import 'package:get/get.dart';
import 'package:upwatch/screen/forgot_password_screen/forgot_password_controller.dart';

class ForgotPasswordBinding implements Bindings {
  @override
  void dependencies() {
    Get.put<ForgotPasswordController>(ForgotPasswordController());
  }
}
