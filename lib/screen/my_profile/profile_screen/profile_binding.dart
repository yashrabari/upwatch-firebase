import 'package:get/get.dart';
import 'package:upwatch/screen/my_profile/profile_screen/profile_controller.dart';

class ProfileBinding extends Bindings {
  @override
  void dependencies() {
    // TODO: implement dependencies
    Get.put<ProfileController>(ProfileController());
  }
}
