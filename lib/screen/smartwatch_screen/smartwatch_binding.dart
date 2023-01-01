import 'package:get/get.dart';
import 'package:upwatch/screen/smartwatch_screen/smartwatch_controller.dart';

class ConnectionBinding implements Bindings {
  @override
  void dependencies() {
    Get.put<ConnectionController>(ConnectionController());
  }
}
