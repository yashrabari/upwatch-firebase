import 'package:get/get.dart';

import 'new_password_controller.dart';

class NewPasswordBinding implements Bindings {
  @override
  void dependencies() {
    Get.put<NewPasswordController>(NewPasswordController());
  }
}
