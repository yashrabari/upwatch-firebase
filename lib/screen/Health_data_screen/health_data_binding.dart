import 'package:get/get.dart';
import 'package:upwatch/screen/Health_details_screen/health_details_controller.dart';

class HealthDetailsBinding implements Bindings {
  @override
  void dependencies() {
    Get.put<HealthDetailsController>(HealthDetailsController());
  }
}
