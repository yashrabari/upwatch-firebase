import 'package:get/get.dart';
import 'package:upwatch/common/all.dart';
import 'package:upwatch/common/image_path.dart';
import 'package:upwatch/common/rx_common_model.dart';
import 'package:upwatch/common/strings.dart';

class HealthDataController extends GetxController {
  AppColors appColors = AppColors();
  Utils utils = Utils();
  RxList<RxCommonModel> healthData = [
    RxCommonModel(title: Strings.bloodGlucose, subTitle: "89", subTitle2: Strings.mgDl, image: ImagePath.bloodGlucose),
    RxCommonModel(title: Strings.bloodOxygen, subTitle: "80", subTitle2: "%", image: ImagePath.bloodOxygen),
    RxCommonModel(title: Strings.bloodPressure, subTitle: "141/90", subTitle2: Strings.mmHg, image: ImagePath.bloodPressure),
    RxCommonModel(title: Strings.bodyTemperature, subTitle: "37c", subTitle2: Strings.degree, image: ImagePath.bodyTemperature),
    RxCommonModel(title: Strings.bodyWeight, subTitle: "90", subTitle2: Strings.kg, image: ImagePath.bodyWeight),
  ].obs;
}
