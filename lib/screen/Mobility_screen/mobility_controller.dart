import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:upwatch/common/all.dart';

class MobilityController extends GetxController {
  AppColors appColors = AppColors();
  var isExpand = false.obs;

  /// Pie chart
  List<Data> data1 = [
    Data(name: 'Arm-swing', percent: 20, color: Color(0xffFF00FF)),
    Data(name: 'Hands in pocket', percent: 20, color: Color(0xffFF2A00)),
    Data(name: 'Texting', percent: 20, color: Color(0xffA5A5A5)),
    Data(name: 'Phone-call', percent: 20, color: Color(0xffFCB800)),
    Data(name: 'Shoulder-bag', percent: 20, color: Color(0xffF47800)),
  ];

  List<PieChartSectionData> sections() => data1
      .asMap()
      .map<int, PieChartSectionData>((index, data1) {
        final double radius = 46;

        final value = PieChartSectionData(
          color: data1.color,
          radius: radius,
          title: "",
          titleStyle: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
            color: Color(0xffffffff),
          ),
        );

        return MapEntry(index, value);
      })
      .values
      .toList();

  /// physical acitivity level
  var physicalActivityLevel = [
    Strings.runningDuration,
    Strings.step_Count,
    Strings.longestWalkingDuration,
    Strings.walksSccond,
  ];
  var physicalLevel = [
    "10 min",
    "8671",
    "267 sec",
    "40%",
  ];

  // walking speed
  var walkingSpeedList = [
    Strings.usual,
    Strings.maximal,
  ];
  var walkingSpeedLevel = [
    "1.20ms-1",
    "1.45ms-1",
  ];

  /// physical acitivity level
  var walkingQuality = [
    Strings.cadence,
    Strings.stepTimeVariability,
    Strings.harmonicRatio,
    Strings.stepRegularity,
  ];
  var walkingQualityLevel = [
    "100spm",
    "3.6",
    "11.7",
    "61.5%",
  ];

  /// line chart
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
        FlSpot(2, 8.4),
        FlSpot(3, 6),
        FlSpot(4, 5),
        FlSpot(5, 8),
        FlSpot(6, 8.6),
        FlSpot(7, 5),
      ],
    )
  ];

  //// Walking Performance Progress
  var walkingPerformanceProgressList = [
    Strings.step_Count,
    Strings.longestWalk,
    Strings.usualSpeed,
    Strings.stepTimeVariability,
    Strings.stepRegularity,
    Strings.maxSpeed,
  ];
}

class Data {
  final String? name;
  final double? radius;

  final double? percent;

  final Color? color;

  Data({this.radius, this.name, this.percent, this.color});
}
