import 'package:get/get.dart';

import 'contact_us_controller.dart';

class ContactUsBinding implements Bindings {
  @override
  void dependencies() {
    Get.put<ContactUsController>(ContactUsController());
  }
}
