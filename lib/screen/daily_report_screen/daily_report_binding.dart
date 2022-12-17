import 'package:get/get.dart';

import 'daily_report_controller.dart';

class DailyReportBinding implements Bindings {
  @override
  void dependencies() {
    Get.put<DailyReportController>(DailyReportController());
  }
}
