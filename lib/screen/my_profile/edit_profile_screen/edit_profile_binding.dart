import 'package:get/get.dart';
import 'package:upwatch/screen/my_profile/edit_profile_screen/edit_profile_controller.dart';

class EditProfileBinding extends Bindings {
  @override
  void dependencies() {
    // TODO: implement dependencies
    Get.put<EditProfileController>(EditProfileController());
  }
}
