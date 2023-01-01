import 'package:get/get.dart';
import 'package:upwatch/common/all.dart';

class DiseaseRiskDetailsController extends GetxController {
  AppColors appColors = AppColors();
  Utils utils = Utils();
  var diseaseRiskDetails;
  var selectedValue = 0.obs;

  List<double> value = [
    50,
    60,
    80,
    40,
    50,
    90,
    70,
  ];
  List<String> week = [
    "Mo",
    "Tu",
    "We",
    "Th",
    "Fr",
    "Sa",
    "Su",
  ];

  List<Color> gradiantColor = [
    AppColors().appOrange1,
    AppColors().appOrange2,
  ];

  List days = [
    Strings.week,
    Strings.month,
    Strings.sixMonth,
    Strings.year,
  ];

  List days1 = [
    Strings.weekly,
    Strings.monthly,
    Strings.sixMonth,
    Strings.yearly,
  ];

  @override
  void onInit() {
    diseaseRiskDetails = Get.arguments;
    super.onInit();
  }
}
