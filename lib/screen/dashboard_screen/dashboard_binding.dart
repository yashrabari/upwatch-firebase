import 'package:get/get.dart';
import 'package:upwatch/screen/dashboard_screen/dashboard_controller.dart';

class DashboardBinding implements Bindings {
  @override
  void dependencies() {
    Get.put<DashboardSettingController>(DashboardSettingController());
  }
}
