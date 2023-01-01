import 'package:get/get.dart';
import 'package:upwatch/screen/tutorial_screen/tutorial_controller.dart';

class TutorialBinding implements Bindings {
  @override
  void dependencies() {
    Get.put<TutorialController>(TutorialController());
  }
}
