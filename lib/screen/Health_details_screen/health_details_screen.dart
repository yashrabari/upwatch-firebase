import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:upwatch/Widget/custom_appbar.dart';
import 'package:upwatch/common/all.dart';
import 'package:upwatch/common/common_widget.dart';
import 'package:upwatch/common/constants.dart';
import 'package:upwatch/common/gradiant_app_text.dart';
import 'package:upwatch/screen/Health_details_screen/health_details_controller.dart';

class HealthDetailsScreen extends GetView<HealthDetailsController> {
  static const routes = "/HealthDetailsScreen";

  @override
  Widget build(BuildContext context) {
    Get.put(HealthDetailsController());
    return GetBuilder<HealthDetailsController>(
      assignId: true,
      builder: (logic) {
        return Scaffold(
          appBar: CustomAppBar(
            isLeading: true,
          ),
          body: SingleChildScrollView(
            physics: BouncingScrollPhysics(),
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: AppDimensions().horizontalWholeApp),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  SizedBox(height: 2.h),
                  MyTextView(
                    controller.bodyDetails["title"],
                    textStyleNew: TextStyle(
                      fontFamily: AppFontFamily.GothamRoundedMedium,
                      fontWeight: FontWeight.w400,
                      fontSize: 20.sp,
                    ),
                  ),
                  MyTextView(
                    controller.date ?? "",
                    textStyleNew: TextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: 17.sp,
                      color: controller.appColors.textColors,
                    ),
                  ),
                  SizedBox(height: 3.h),
                  Container(
                    padding: EdgeInsets.symmetric(vertical: 3.h),
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: controller.appColors.textColors.withOpacity(0.1),
                      borderRadius: BorderRadius.circular(1.h),
                    ),
                    child: Center(
                      child: Column(
                        children: [
                          MyTextView(
                            Strings.today,
                            textStyleNew: TextStyle(
                              fontFamily: AppFontFamily.GothamRoundedMedium,
                              fontWeight: FontWeight.w400,
                              fontSize: 18.px,
                            ),
                          ),
                          SizedBox(height: 10.px),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              GradientText(
                                "${controller.bodyDetails["decimal"]}",
                                gradient: controller.utils.textGradiant,
                                style: TextStyle(
                                  fontFamily: AppFontFamily.GothamRoundedMedium,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 30.px,
                                ),
                              ),
                              SizedBox(width: 1.w),
                              Padding(
                                padding: EdgeInsets.only(bottom: 2),
                                child: MyTextView(
                                  controller.bodyDetails["decimalType"],
                                  textStyleNew: TextStyle(
                                    fontFamily: AppFontFamily.GothamRoundedMedium,
                                    fontWeight: FontWeight.w500,
                                    fontSize: 16.px,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(height: 2.h),
                  Obx(() {
                    return Container(
                      width: double.infinity,
                      padding: EdgeInsets.all(20.px),
                      decoration: BoxDecoration(
                        color: controller.appColors.textColors.withOpacity(0.1),
                        borderRadius: BorderRadius.circular(1.h),
                      ),
                      child: Column(
                        children: [
                          Row(
                            children: List.generate(
                                controller.days.length,
                                (index) => GestureDetector(
                                      onTap: () {
                                        controller.selectedValue.value = index;
                                        printOkStatus("....................>>>>>> ${controller.selectedValue.value}");
                                      },
                                      child: Padding(
                                        padding: EdgeInsets.only(right: 7.w),
                                        child: Column(
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: [
                                            GradientText(
                                              controller.days[index],
                                              gradient: controller.selectedValue.value == index
                                                  ? controller.utils.textGradiant
                                                  : LinearGradient(colors: [
                                                      controller.appColors.textColors,
                                                      controller.appColors.textColors,
                                                    ]),
                                              style: TextStyle(
                                                fontFamily: AppFontFamily.GothamRoundedMedium,
                                                fontWeight: FontWeight.bold,
                                                fontSize: 15.sp,
                                              ),
                                            ),
                                            SizedBox(height: 0.5.h),
                                            controller.selectedValue.value == index
                                                ? Container(
                                                    height: 0.4.h,
                                                    width: 5.w,
                                                    decoration: BoxDecoration(
                                                      borderRadius: BorderRadius.circular(1.h),
                                                      gradient: controller.utils.textGradiant,
                                                    ),
                                                  )
                                                : Container(
                                                    height: 0.4.h,
                                                  ),
                                          ],
                                        ),
                                      ),
                                    )),
                          ),
                          SizedBox(height: 2.h),
                          Container(
                            padding: EdgeInsets.symmetric(vertical: 3.h, horizontal: 5),
                            width: double.infinity,
                            decoration: BoxDecoration(
                              color: controller.appColors.textColors.withOpacity(0.1),
                              borderRadius: BorderRadius.circular(1.h),
                            ),
                            child: Center(
                              child: Column(
                                children: [
                                  MyTextView(
                                    "${controller.daysAvg[controller.selectedValue.value]} Avg ${controller.bodyDetails["title"]}",
                                    isMaxLineWrap: true,
                                    textAlignNew: TextAlign.center,
                                    textStyleNew: TextStyle(
                                      fontFamily: AppFontFamily.GothamRoundedMedium,
                                      fontWeight: FontWeight.w400,
                                      fontSize: 17.sp,
                                    ),
                                  ),
                                  SizedBox(height: 10.px),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment: CrossAxisAlignment.end,
                                    children: [
                                      GradientText(
                                        "${controller.bodyDetails["decimal"]}",
                                        gradient: controller.utils.textGradiant,
                                        style: TextStyle(
                                          fontFamily: AppFontFamily.GothamRoundedMedium,
                                          fontWeight: FontWeight.bold,
                                          fontSize: 30.px,
                                        ),
                                      ),
                                      SizedBox(width: 1.w),
                                      Padding(
                                        padding: EdgeInsets.only(bottom: 2),
                                        child: MyTextView(
                                          controller.bodyDetails["decimalType"],
                                          textStyleNew: TextStyle(
                                            fontFamily: AppFontFamily.GothamRoundedMedium,
                                            fontWeight: FontWeight.w500,
                                            fontSize: 16.px,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ),
                          SizedBox(height: 2.h),
                          Container(
                            padding: EdgeInsets.symmetric(vertical: 20, horizontal: 20),
                            height: 300,
                            width: double.infinity,
                            decoration: BoxDecoration(
                              color: controller.appColors.textColors.withOpacity(0.1),
                              borderRadius: BorderRadius.circular(1.h),
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                MyTextView(
                                  "${controller.daysAvg[controller.selectedValue.value]} ${controller.bodyDetails["title"]} Levels",
                                  isMaxLineWrap: true,
                                  textAlignNew: TextAlign.center,
                                  textStyleNew: TextStyle(
                                    fontFamily: AppFontFamily.GothamRoundedMedium,
                                    fontWeight: FontWeight.w500,
                                    fontSize: 14.px,
                                  ),
                                ),
                                SizedBox(height: 20),
                                Expanded(
                                  child: LineChart(
                                    LineChartData(
                                      borderData: FlBorderData(border: Border.all(color: Colors.black, width: 0.5), show: false),
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
                                                return 'S';
                                              case 2:
                                                return 'M';
                                              case 3:
                                                return 'T';
                                              case 4:
                                                return 'W';
                                              case 5:
                                                return 'T';
                                              case 6:
                                                return 'F';
                                              case 7:
                                                return 'S';
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
                                              case 1:
                                                return '0';

                                              case 5:
                                                return '50';

                                              case 10:
                                                return '100';

                                              case 15:
                                                return '200';
                                            }
                                            return '';
                                          },
                                        ),
                                      ),
                                      minX: 0,
                                      minY: 0,
                                      maxX: 7,
                                      maxY: 15,
                                      lineBarsData: controller.lineChartBarData,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          )
                        ],
                      ),
                    );
                  })
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  HealthDetailsScreen();
}

class SalesData {
  SalesData({this.year, this.sales});
  final double? year;
  final double? sales;
}
