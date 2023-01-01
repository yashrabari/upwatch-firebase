import 'package:get/get.dart';
import 'package:upwatch/screen/verify_email_screen/verify_email_controller.dart';

class VerifyEmailBinding implements Bindings {
  @override
  void dependencies() {
    Get.put<VerifyEmailController>(VerifyEmailController());
  }
}
