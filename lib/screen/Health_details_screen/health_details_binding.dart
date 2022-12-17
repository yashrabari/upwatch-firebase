import 'package:get/get.dart';
import 'package:upwatch/screen/Health_data_screen/health_data_controller.dart';

class HealthDataBinding implements Bindings {
  @override
  void dependencies() {
    Get.put<HealthDataController>(HealthDataController());
  }
}
