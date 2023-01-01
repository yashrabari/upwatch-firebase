import 'package:get/get.dart';
import 'package:upwatch/screen/language_change_screen/language_change_controller.dart';

class LanguageChangeBinding implements Bindings {
  @override
  void dependencies() {
    Get.put<LanguageChangeController>(LanguageChangeController());
  }
}
