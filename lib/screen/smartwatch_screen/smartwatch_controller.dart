import 'package:get/get.dart';

import '../../common/all.dart';

class ConnectionController extends GetxController {
  AppColors appColors = AppColors();

  var screenFlag;

  @override
  void onInit() {
    screenFlag = Get.arguments;
    super.onInit();
  }
}
