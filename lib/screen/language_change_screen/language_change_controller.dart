import 'package:get/get.dart';
import 'package:upwatch/base_controller.dart';

class LanguageChangeController extends BaseController {
  RxBool isAgree = false.obs;
  String identify = "";

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();

    if (Get.arguments != null) {
      identify = Get.arguments[0];
    }
  }
}
