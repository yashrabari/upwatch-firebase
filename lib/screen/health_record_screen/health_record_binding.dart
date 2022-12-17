import 'package:get/get.dart';
import 'package:upwatch/screen/health_record_screen/health_record_controller.dart';

class HealthRecordBinding implements Bindings {
  @override
  void dependencies() {
    Get.put<HealthRecordController>(HealthRecordController());
  }
}
