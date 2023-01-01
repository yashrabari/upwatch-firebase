import 'package:get/get.dart';
import 'package:upwatch/screen/home_screen/notifications_screen/notifications_controller.dart';

class NotificationsBinding extends Bindings {
  @override
  void dependencies() {
    // TODO: implement dependencies
    Get.put<NotificationsController>(NotificationsController());
  }
}
