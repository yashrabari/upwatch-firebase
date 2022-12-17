import 'package:get/get.dart';

import 'delete_confirm_controller.dart';

class DeleteConfirmBinding implements Bindings {
  @override
  void dependencies() {
    Get.put<DeleteConfirmController>(DeleteConfirmController());
  }
}
