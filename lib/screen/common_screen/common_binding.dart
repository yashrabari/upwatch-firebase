import 'package:get/get.dart';

import 'common_controller.dart';

class CommonBinding implements Bindings {
  @override
  void dependencies() {
    Get.put<CommonController>(CommonController());
  }
}
