import 'package:flutter/material.dart';
import 'package:upwatch/screen/disease_risk_screen/gradiant_pie_chart/pie_chart.dart';
import 'package:upwatch/screen/disease_risk_screen/gradiant_pie_chart/utils.dart';

class LegendOptions {
  final bool showLegends;
  final bool showLegendsInRow;
  final TextStyle legendTextStyle;
  final BoxShape legendShape;
  final LegendPosition? legendPosition;
  final Map<String, String> legendLabels;

  const LegendOptions({
    this.showLegends = true,
    this.showLegendsInRow = false,
    this.legendTextStyle = defaultLegendStyle,
    this.legendShape = BoxShape.circle,
    this.legendPosition = LegendPosition.right,
    this.legendLabels = const {},
  });
}
