import 'package:get/get.dart';

import 'delete_account_controller.dart';

class DeleteAccountBinding implements Bindings {
  @override
  void dependencies() {
    Get.put<DeleteAccountController>(DeleteAccountController());
  }
}
