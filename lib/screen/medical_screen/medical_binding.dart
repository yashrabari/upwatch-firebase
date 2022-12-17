import 'package:get/get.dart';

import 'medical_controller.dart';

class MedicalBinding implements Bindings {
  @override
  void dependencies() {
    Get.put<MedicalController>(MedicalController());
  }
}
