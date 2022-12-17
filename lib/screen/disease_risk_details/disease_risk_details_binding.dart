import 'package:get/get.dart';
import 'package:upwatch/screen/disease_risk_details/disease_risk_details_controller.dart';

class DiseaseRiskDetailsBinding implements Bindings {
  @override
  void dependencies() {
    Get.put<DiseaseRiskDetailsController>(DiseaseRiskDetailsController());
  }
}
