import 'package:get/get.dart';
import 'package:syncfusion_flutter_datepicker/datepicker.dart';
import 'package:upwatch/base_controller.dart';

class DailyReportController extends BaseController {
  void onSelectionChanged(DateRangePickerSelectionChangedArgs dateRangePickerSelectionChangedArgs) {}
  RxString date = "".obs;
  String? toDayDate;
  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    toDayDate = utils.changeDateFormat(date: DateTime.now(), outputFormat: 'dd MMM yyyy');
  }
}
