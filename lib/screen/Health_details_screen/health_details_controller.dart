import 'package:fl_chart/fl_chart.dart';
import 'package:get/get.dart';
import 'package:upwatch/common/all.dart';

class HealthDetailsController extends GetxController {
  AppColors appColors = AppColors();
  Utils utils = Utils();

  var bodyDetails;
  var selectedValue = 0.obs;
  List days = [
    Strings.week,
    Strings.month,
    Strings.sixMonth,
    Strings.year,
  ];

  List daysAvg = [
    Strings.weekly,
    Strings.monthly,
    Strings.sixMonth,
    Strings.yearly,
  ];

  static List<Color> lineColor = [
    Color(0xffF7B733),
    Color(0xffFC4A1A),
  ];

  List<LineChartBarData> lineChartBarData = [
    LineChartBarData(
      isStrokeCapRound: true,
      colors: lineColor,
      isCurved: true,
      spots: [
        FlSpot(1, 8),
        FlSpot(2, 12.4),
        FlSpot(3, 10.8),
        FlSpot(4, 9),
        FlSpot(5, 8),
        FlSpot(6, 8.6),
        FlSpot(7, 10),
      ],
    )
  ];

  String? date;

  @override
  void onInit() {
    bodyDetails = Get.arguments;
    date = utils.changeDateFormat(date: DateTime.now(), outputFormat: 'dd MMM yyyy');
    super.onInit();
  }
}
