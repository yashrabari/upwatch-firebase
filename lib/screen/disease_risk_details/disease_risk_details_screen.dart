import 'package:upwatch/Widget/custom_appbar.dart';
import 'package:upwatch/common/constants.dart';
import 'package:upwatch/common/gradiant_app_text.dart';
import 'package:upwatch/screen/disease_risk_details/bar_graph.dart';
import 'package:upwatch/screen/disease_risk_details/disease_risk_details_controller.dart';
import 'package:upwatch/screen/disease_risk_screen/gradiant_pie_chart/pie_chart.dart';

import '../../common/all.dart';

class DiseaseRiskDetailsScreen extends GetView<DiseaseRiskDetailsController> {
  static const routes = "/DiseaseRiskDetailsScreen";

  @override
  Widget build(BuildContext context) {
    Get.put(DiseaseRiskDetailsController());
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
            children: [
              SizedBox(
                height: 3.h,
              ),
              MyTextView(
                controller.diseaseRiskDetails,
                textStyleNew: TextStyle(
                  fontFamily: AppFontFamily.GothamRoundedMedium,
                  fontWeight: FontWeight.w400,
                  fontSize: 26.px,
                ),
              ),
              SizedBox(height: 5.px),
              MyTextView(
                "Lorem Ipsum is simply dummy text of the printing and typesetting industry.",
                isMaxLineWrap: true,
                textStyleNew: TextStyle(
                  fontWeight: FontWeight.w500,
                  fontSize: 16.px,
                  color: controller.appColors.textColors,
                ),
              ),
              SizedBox(
                height: 3.h,
              ),
              Align(
                alignment: Alignment.center,
                child: Container(
                  height: 250,
                  width: 250,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Color(0xffF2F2F2),
                  ),
                  child: AspectRatio(
                    aspectRatio: 1,
                    child: Stack(
                      alignment: Alignment.center,
                      children: [
                        GradiantPieChart(
                          totalValue: 100,
                          ringStrokeWidth: 25,
                          chartType: ChartType.ring,
                          chartRadius: 180,
                          gradientList: [
                            controller.gradiantColor,
                          ],
                          emptyColorGradient: [
                            controller.appColors.appText.withOpacity(0.06),
                            controller.appColors.appText.withOpacity(0.06),
                          ],
                          dataMap: {
                            "value-2": 75,
                            "value-1": 25,
                          },
                        ),
                        GradientText(
                          "25%",
                          gradient: controller.utils.textGradiant,
                          style: TextStyle(
                            fontFamily: AppFontFamily.GothamRoundedMedium,
                            fontWeight: FontWeight.w500,
                            fontSize: 32.px,
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ),
              SizedBox(height: 3.5.h),
              Obx(() {
                return Container(
                  width: double.infinity,
                  padding: EdgeInsets.all(20.px),
                  decoration: BoxDecoration(
                    color: controller.appColors.textColors.withOpacity(0.06),
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
                                              : LinearGradient(
                                                  colors: [
                                                    controller.appColors.textColors.withOpacity(0.7),
                                                    controller.appColors.textColors.withOpacity(0.7),
                                                  ],
                                                ),
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
                        padding: EdgeInsets.symmetric(vertical: 20.px, horizontal: 20.px),
                        height: 300,
                        width: double.infinity,
                        decoration: BoxDecoration(
                          color: controller.appColors.textColors.withOpacity(0.07),
                          borderRadius: BorderRadius.circular(1.h),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            MyTextView(
                              "${controller.days1[controller.selectedValue.value]} ${controller.diseaseRiskDetails}",
                              textStyleNew: TextStyle(
                                fontFamily: AppFontFamily.GothamRoundedMedium,
                                fontWeight: FontWeight.w500,
                                fontSize: 17.sp,
                                color: controller.appColors.appText,
                              ),
                            ),
                            SizedBox(height: 20),
                            Expanded(
                              child: Container(
                                width: double.infinity,
                                color: Colors.transparent,
                                margin: EdgeInsets.symmetric(horizontal: 0),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                                  children: List.generate(
                                    7,
                                    (index) => Column(
                                      children: [
                                        MyTextView(
                                          "${controller.value[index].toStringAsFixed(0)}%",
                                          textStyleNew: MyTextStyle(
                                            textWeight: FontWeight.w500,
                                            textFamily: AppFontFamily.GothamRoundedMedium,
                                            textColor: controller.appColors.appText,
                                            textSize: 15.sp,
                                          ),
                                        ),
                                        SizedBox(height: 5),
                                        Expanded(
                                          child: FAProgressBar(
                                            animatedDuration: Duration(seconds: 1),
                                            progressColor: Colors.white,
                                            backgroundColor: controller.appColors.appText.withOpacity(0.07),
                                            direction: Axis.vertical,
                                            borderRadius: BorderRadius.circular(25),
                                            verticalDirection: VerticalDirection.up,
                                            currentValue: controller.value[index],
                                            size: 20,
                                          ),
                                        ),
                                        MyTextView(
                                          controller.week[index],
                                          textStyleNew: MyTextStyle(
                                            textWeight: FontWeight.w500,
                                            textFamily: AppFontFamily.GothamRoundedMedium,
                                            textColor: controller.appColors.textColors,
                                            textSize: 15.sp,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
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
  }
}
