import 'package:get/get.dart';
import 'package:upwatch/base_controller.dart';

class MedicalController extends BaseController {
  String identify = "";

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
  }

  @override
  void onReady() {
    // TODO: implement onReady
    super.onReady();
    if (Get.arguments != null) {
      identify = Get.arguments[0];
      update();
    }
  }
}
