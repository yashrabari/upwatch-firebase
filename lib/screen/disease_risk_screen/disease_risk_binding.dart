import 'package:get/get.dart';
import 'package:upwatch/screen/disease_risk_screen/disease_risk_controller.dart';

class DiseaseRiskBinding implements Bindings {
  @override
  void dependencies() {
    Get.put<DiseaseRiskController>(DiseaseRiskController());
  }
}
