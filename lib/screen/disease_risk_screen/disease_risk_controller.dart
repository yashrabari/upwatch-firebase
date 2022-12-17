import 'package:get/get.dart';
import 'package:upwatch/common/all.dart';

class DiseaseRiskController extends GetxController {
  AppColors appColor = AppColors();
  Utils utils = Utils();
  List diseaseRiskList = [
    Strings.fallRisk,
    Strings.strokeRisk,
    Strings.dementiaRisk,
    Strings.pakinsonRisk,
  ];
  List diseaseRiskImageList = [
    ImagePath.tightropeWalker,
    ImagePath.brain,
    ImagePath.dissociative,
    ImagePath.geriatrics,
  ];
}
