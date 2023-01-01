import 'package:get/get.dart';
import 'package:upwatch/screen/welcome_screen/welcome_controller.dart';

class WelcomeBinding implements Bindings {
  @override
  void dependencies() {
    Get.put<WelcomeController>(WelcomeController());
  }
}
