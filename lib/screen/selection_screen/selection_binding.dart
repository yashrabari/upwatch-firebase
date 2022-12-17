import 'package:get/get.dart';

import 'selection_controller.dart';

class SelectionBinding implements Bindings {
  @override
  void dependencies() {
    Get.put<SelectionController>(SelectionController());
  }
}
