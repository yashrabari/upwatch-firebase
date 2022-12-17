import 'package:get/get.dart';
import 'package:upwatch/screen/login_screen/login_controller.dart';

class LoginBinding implements Bindings {
  @override
  void dependencies() {
    Get.put<LoginController>(LoginController());
  }
}
