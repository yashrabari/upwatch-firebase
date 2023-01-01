import 'package:get/get.dart';
import 'package:upwatch/screen/splash_screen/splash_controller.dart';

class SplashBinding implements Bindings {
  @override
  void dependencies() {
    Get.put<SplashController>(SplashController());
  }
}
