import 'package:flutter/material.dart';
import 'package:upwatch/screen/disease_risk_screen/gradiant_pie_chart/utils.dart';

class ChartValuesOptions {
  final bool showChartValueBackground;
  final int decimalPlaces;
  final bool showChartValuesInPercentage;
  final bool showChartValues;
  final bool showChartValuesOutside;
  final Color? chartValueBackgroundColor;
  final TextStyle chartValueStyle;

  const ChartValuesOptions({
    this.showChartValueBackground = true,
    this.decimalPlaces = 1,
    this.chartValueBackgroundColor,
    this.showChartValuesInPercentage = false,
    this.chartValueStyle = defaultChartValueStyle,
    this.showChartValues = true,
    this.showChartValuesOutside = false,
  });
}
