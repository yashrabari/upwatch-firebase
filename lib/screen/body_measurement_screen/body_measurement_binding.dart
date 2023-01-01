import 'package:get/get.dart';
import 'package:upwatch/screen/body_measurement_screen/body_measurement_controller.dart';

class BodyMeasurementBinding implements Bindings {
  @override
  void dependencies() {
    Get.put<BodyMeasurementController>(BodyMeasurementController());
  }
}
