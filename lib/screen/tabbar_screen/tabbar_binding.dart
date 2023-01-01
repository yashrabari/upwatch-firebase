import 'package:get/get.dart';
import 'package:upwatch/screen/tabbar_screen/tabbar_controller.dart';

class TabBarBinding extends Bindings {
  @override
  void dependencies() {
    Get.put<TabBarController>(TabBarController());
  }
}
