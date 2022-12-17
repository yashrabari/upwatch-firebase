import 'package:d_chart/d_chart.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';
import 'package:upwatch/common/constants.dart';
import 'package:upwatch/screen/Mobility_screen/expansion_container.dart';
import 'package:upwatch/screen/Mobility_screen/mobility_controller.dart';
import 'package:upwatch/screen/base_screen.dart';

import '../../common/all.dart';

class MobilityScreen extends GetView<MobilityController> {
  static const routes = "/MobilityScreen";

  @override
  Widget build(BuildContext context) {
    Get.put(MobilityController());
    return GetBuilder<MobilityController>(
      assignId: true,
      builder: (logic) {
        return BaseScreen(
          child: Column(
            children: [
              Padding(
                padding: EdgeInsets.only(top: 3.5.h),
                child: CommonBackArrow(
                  isBack: false,
                  isTitle: true,
                  title: Strings.mobility,
                ),
              ),
              Expanded(
                child: ListView(
                  physics: BouncingScrollPhysics(),
                  padding: EdgeInsets.zero,
                  children: [
                    SizedBox(height: 2.h),
                    Container(
                      padding: EdgeInsets.symmetric(horizontal: 3.h),
                      width: double.infinity,
                      decoration: BoxDecoration(
                        color: controller.appColors.appText.withOpacity(0.05),
                        borderRadius: BorderRadius.circular(1.h),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(height: 20.px),
                          MyTextView(
                            Strings.totalCompositeScore,
                            textStyleNew: TextStyle(
                              fontFamily: AppFontFamily.GothamRoundedMedium,
                              fontWeight: FontWeight.w500,
                              fontSize: 16.px,
                            ),
                          ),
                          AspectRatio(
                              aspectRatio: 1,
                              child: Stack(
                                alignment: Alignment.center,
                                children: [
                                  /*PieChart(
                                    PieChartData(
                                      pieTouchData: PieTouchData(enabled: true),
                                      sections: controller.sections(),
                                      centerSpaceRadius: 50,
                                      sectionsSpace: 0,
                                      borderData: FlBorderData(show: false),
                                    ),
                                  ),*/
                                  Padding(
                                    padding: EdgeInsets.all(25.px),
                                    child: DChartPie(
                                      data: [
                                        {'domain': controller.data1[0].name, 'measure': 10},
                                        {'domain': controller.data1[1].name, 'measure': 15},
                                        {'domain': controller.data1[2].name, 'measure': 5},
                                        {'domain': controller.data1[3].name, 'measure': 18},
                                        {'domain': controller.data1[4].name, 'measure': 8},
                                      ],
                                      fillColor: (pieData, index) => index == 0
                                          ? controller.data1[0].color
                                          : index == 1
                                              ? controller.data1[1].color
                                              : index == 2
                                                  ? controller.data1[2].color
                                                  : index == 3
                                                      ? controller.data1[3].color
                                                      : controller.data1[4].color,
                                      donutWidth: 20,
                                      showLabelLine: false,
                                      strokeWidth: 0,
                                      labelColor: controller.appColors.transparent,
                                      //labelColor: appColors.textAppColor,
                                    ),
                                  ),
                                  MyTextView(
                                    "95 %",
                                    textStyleNew: TextStyle(
                                      fontFamily: AppFontFamily.GothamRoundedMedium,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 30.px,
                                    ),
                                  ),
                                ],
                              )),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: List.generate(
                                5,
                                (index) => Center(
                                      child: Container(
                                        margin: EdgeInsets.only(bottom: 1.h),
                                        // color: Colors.amber.withOpacity(0.45),z
                                        height: 20,
                                        width: 18.h,
                                        child: Row(
                                          mainAxisAlignment: MainAxisAlignment.start,
                                          crossAxisAlignment: CrossAxisAlignment.center,
                                          children: [
                                            Container(
                                              height: 13,
                                              width: 13,
                                              decoration: BoxDecoration(
                                                color: controller.data1[index].color,
                                                shape: BoxShape.circle,
                                              ),
                                            ),
                                            SizedBox(width: 10.px),
                                            MyTextView(
                                              "${controller.data1[index].name}",
                                              textAlignNew: TextAlign.center,
                                              textStyleNew: TextStyle(
                                                color: controller.appColors.appText,
                                                fontFamily: AppFontFamily.GothamRounded,
                                                fontWeight: FontWeight.w500,
                                                fontSize: 13.px,
                                                height: 1.5,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    )),
                          ),
                          SizedBox(height: 2.h),
                        ],
                      ),
                    ),
                    SizedBox(height: 2.h),
                    ExpansionContainer(
                      height: 40.h,
                      title: Strings.physicalActivityLevel,
                      children: List.generate(
                          4,
                          (index) => Column(
                                children: [
                                  Row(
                                    children: [
                                      MyTextView(
                                        controller.physicalActivityLevel[index],
                                        textStyleNew: TextStyle(
                                          fontWeight: FontWeight.w500,
                                          fontSize: 13.px,
                                          color: controller.appColors.appText,
                                        ),
                                      ),
                                      Spacer(),
                                      MyTextView(
                                        controller.physicalLevel[index],
                                        textStyleNew: TextStyle(
                                          fontSize: 13.px,
                                          fontFamily: AppFontFamily.GothamRoundedMedium,
                                          fontWeight: FontWeight.w500,
                                          color: controller.appColors.appText,
                                        ),
                                      ),
                                    ],
                                  ),
                                  SizedBox(height: 1.h),
                                  LinearPercentIndicator(
                                    lineHeight: 15.0,
                                    padding: EdgeInsets.zero,
                                    barRadius: Radius.circular(2.h),
                                    percent: 0.5,
                                    progressColor: controller.data1[index].color,
                                  )
                                ],
                              )),
                    ),
                    SizedBox(height: 2.h),
                    ExpansionContainer(
                      height: 20.h,
                      title: Strings.walkingSpeed,
                      children: List.generate(
                          2,
                          (index) => Column(
                                children: [
                                  Row(
                                    children: [
                                      MyTextView(
                                        controller.walkingSpeedList[index],
                                        textStyleNew: TextStyle(
                                          fontWeight: FontWeight.w500,
                                          fontSize: 13.px,
                                          color: controller.appColors.appText,
                                        ),
                                      ),
                                      Spacer(),
                                      MyTextView(
                                        controller.walkingSpeedLevel[index],
                                        textStyleNew: TextStyle(
                                          fontSize: 13.px,
                                          fontFamily: AppFontFamily.GothamRoundedMedium,
                                          color: controller.appColors.appText,
                                        ),
                                      ),
                                    ],
                                  ),
                                  SizedBox(height: 1.h),
                                  LinearPercentIndicator(
                                    lineHeight: 15.0,
                                    padding: EdgeInsets.zero,
                                    barRadius: Radius.circular(2.h),
                                    percent: 0.5,
                                    progressColor: controller.data1[index].color,
                                  )
                                ],
                              )),
                    ),
                    SizedBox(height: 2.h),
                    ExpansionContainer(
                      height: 40.h,
                      title: Strings.walkingQuality,
                      children: List.generate(
                          4,
                          (index) => Column(
                                children: [
                                  Row(
                                    children: [
                                      MyTextView(
                                        controller.walkingQuality[index],
                                        textStyleNew: TextStyle(
                                          fontWeight: FontWeight.w500,
                                          fontSize: 13.px,
                                          color: controller.appColors.appText,
                                        ),
                                      ),
                                      Spacer(),
                                      MyTextView(
                                        controller.walkingQualityLevel[index],
                                        textStyleNew: TextStyle(
                                          fontSize: 13.px,
                                          fontFamily: AppFontFamily.GothamRoundedMedium,
                                          color: controller.appColors.appText,
                                        ),
                                      ),
                                    ],
                                  ),
                                  SizedBox(height: 1.h),
                                  LinearPercentIndicator(
                                    lineHeight: 15.0,
                                    padding: EdgeInsets.zero,
                                    barRadius: Radius.circular(2.h),
                                    percent: 0.5,
                                    progressColor: controller.data1[index].color,
                                  )
                                ],
                              )),
                    ),
                    SizedBox(height: 2.h),
                    ExpansionContainer(
                      flag: 1,
                      height: 170.h,
                      title: Strings.walkingPerformanceProgress,
                      children: List.generate(
                        controller.walkingPerformanceProgressList.length,
                        (index) => Container(
                          padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                          decoration: BoxDecoration(
                            color: Colors.grey.withOpacity(0.1),
                            borderRadius: BorderRadius.circular(1.h),
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              MyTextView(
                                "${controller.walkingPerformanceProgressList[index]}",
                                textStyleNew: TextStyle(
                                  fontFamily: AppFontFamily.GothamRoundedMedium,
                                  fontWeight: FontWeight.w500,
                                  fontSize: 13.px,
                                ),
                              ),
                              SizedBox(height: 10),
                              Container(
                                height: 150,
                                child: LineChart(
                                  LineChartData(
                                    borderData: FlBorderData(border: Border.all(color: controller.appColors.appText, width: 0.5), show: false),
                                    gridData: FlGridData(
                                      drawHorizontalLine: false,
                                    ),
                                    titlesData: FlTitlesData(
                                      bottomTitles: SideTitles(
                                        showTitles: true,
                                        getTextStyles: (BuildContext, double) => TextStyle(
                                          fontFamily: AppFontFamily.GothamRoundedMedium,
                                          color: controller.appColors.textColors,
                                          fontWeight: FontWeight.bold,
                                          fontSize: 15.sp,
                                        ),
                                        getTitles: (value) {
                                          switch (value.toInt()) {
                                            case 1:
                                              return '0';
                                            case 2:
                                              return '1';
                                            case 3:
                                              return '2';
                                            case 4:
                                              return '3';
                                            case 5:
                                              return '4';
                                            case 6:
                                              return '5';
                                            case 7:
                                              return '6';
                                            case 8:
                                              return '7';
                                          }
                                          return '';
                                        },
                                      ),
                                      leftTitles: SideTitles(
                                        showTitles: true,
                                        getTextStyles: (BuildContext, double) => TextStyle(
                                          fontFamily: AppFontFamily.GothamRoundedMedium,
                                          color: controller.appColors.textColors,
                                          fontWeight: FontWeight.bold,
                                          fontSize: 14.9.sp,
                                        ),
                                        getTitles: (value) {
                                          switch (value.toInt()) {
                                            case 0:
                                              return '10';

                                            case 5:
                                              return '20';

                                            case 10:
                                              return '30';
                                          }
                                          return '';
                                        },
                                      ),
                                    ),
                                    minX: 0,
                                    minY: 0,
                                    maxX: 8,
                                    maxY: 15,
                                    lineBarsData: controller.lineChartBarData,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 100),
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
