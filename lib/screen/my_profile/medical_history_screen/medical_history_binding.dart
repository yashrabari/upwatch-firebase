import 'package:get/get.dart';
import 'package:upwatch/screen/my_profile/medical_history_screen/medical_history_controller.dart';

class MedicalHistoryBinding extends Bindings {
  @override
  void dependencies() {
    Get.put<MedicalHistoryController>(MedicalHistoryController());
  }
}
