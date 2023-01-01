import 'package:get/get.dart';
import 'package:upwatch/screen/my_profile/edit_profile_screen/change_password_screen/change_password_controller.dart';

class ChangePasswordBinding extends Bindings {
  @override
  void dependencies() {
    // TODO: implement dependencies
    Get.put<ChangePasswordController>(ChangePasswordController());
  }
}
