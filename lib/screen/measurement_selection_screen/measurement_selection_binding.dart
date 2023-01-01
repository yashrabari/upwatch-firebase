import 'package:get/get.dart';

import 'measurement_selection_controller.dart';

class MeasurementSelectionBinding implements Bindings {
  @override
  void dependencies() {
    Get.put<MeasurementSelectionController>(MeasurementSelectionController());
  }
}
