import 'package:get/get.dart';
import 'package:upwatch/screen/Mobility_screen/mobility_controller.dart';

class HelpBinding implements Bindings {
  @override
  void dependencies() {
    Get.put<MobilityController>(MobilityController());
  }
}
