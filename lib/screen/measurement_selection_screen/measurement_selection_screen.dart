import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/rendering.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';
import 'package:upwatch/common/all.dart';
import 'package:upwatch/screen/tabbar_screen/tabbar_screen.dart';
import 'package:vertical_weight_slider/vertical_weight_slider.dart';

import '../../common/constants.dart';
import '../../common/gradiant_app_text.dart';
import '../base_screen.dart';
import 'measurement_selection_controller.dart';

class MeasurementSelectionScreen extends GetView<MeasurementSelectionController> {
  const MeasurementSelectionScreen({Key? key}) : super(key: key);
  static const routes = "/MeasurementSelectionScreen";

  @override
  Widget build(BuildContext context) {
    return GetBuilder<MeasurementSelectionController>(builder: (logic) {
      return BaseScreen(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 60.px),
            Row(
              children: [
                Expanded(
                  child: LinearPercentIndicator(
                    lineHeight: 6.px,
                    percent: (controller.currentCount.value / controller.listQuestion.length),
                    barRadius: Radius.circular(10.px),
                    backgroundColor: controller.appColors.seperatorColor,
                    progressColor: controller.appColors.btnStart,
                  ),
                ),
              ],
            ),
            Container(
              margin: EdgeInsets.only(top: 20.px, left: 3.w),
              child: MyTextView(
                Strings.stepCount("${controller.currentCount.value}", "2").toUpperCase(),
                isMaxLineWrap: true,
                textAlignNew: TextAlign.center,
                textStyleNew: MyTextStyle(
                  textSize: 15.sp,
                  textColor: controller.appColors.appText,
                  textWeight: FontWeight.w600,
                  textFamily: AppFontFamily.GothamRounded,
                ),
              ),
            ),
            Expanded(
              child: SizedBox(
                width: double.infinity,
                child: CarouselSlider.builder(
                  carouselController: controller.controllerCarousel,
                  options: CarouselOptions(
                    height: 100.h,
                    viewportFraction: 1.0,
                    enlargeCenterPage: false,
                    enableInfiniteScroll: false,
                    scrollPhysics: const NeverScrollableScrollPhysics(),
                  ),
                  itemBuilder: (ctx, indexParent, realIdx) {
                    return Builder(
                      builder: (BuildContext context) {
                        return Container(
                            width: MediaQuery.of(context).size.width,
                            margin: EdgeInsets.symmetric(vertical: 20.px),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                MyTextView(
                                  controller.listQuestion[indexParent].title,
                                  isMaxLineWrap: true,
                                  textAlignNew: TextAlign.start,
                                  textStyleNew: MyTextStyle(
                                    textSize: 18.sp,
                                    textColor: controller.appColors.appText,
                                    textWeight: FontWeight.w600,
                                    textFamily: AppFontFamily.GothamRounded,
                                  ),
                                ),
                                indexParent == 0
                                    ? Expanded(
                                        child: CarouselSlider.builder(
                                          options: CarouselOptions(
                                            height: 18.h,
                                            viewportFraction: 0.26,
                                            enableInfiniteScroll: false,
                                            enlargeCenterPage: true,
                                            initialPage: controller.initialPage.value,
                                            onPageChanged: (int index, CarouselPageChangedReason reason) {
                                              controller.initialPage.value = index;
                                              controller.update();
                                            },
                                            enlargeStrategy: CenterPageEnlargeStrategy.height,
                                          ),
                                          itemBuilder: (ctx, index, realIdx) {
                                            return Builder(
                                              builder: (BuildContext context) {
                                                return Padding(
                                                  padding: EdgeInsets.all(2.0.px),
                                                  child: Container(
                                                    width: MediaQuery.of(context).size.width,
                                                    alignment: Alignment.center,
                                                    margin: const EdgeInsets.symmetric(horizontal: 5.0),
                                                    decoration: BoxDecoration(
                                                      color: controller.initialPage.value == index ? controller.appColors.borderColor.withOpacity(0.3) : Colors.transparent,
                                                      borderRadius: BorderRadius.circular(8.0.px),
                                                      border: Border.all(
                                                        color: controller.initialPage.value == index ? controller.appColors.borderColor.withOpacity(0.3) : Colors.transparent,
                                                      ),
                                                    ),
                                                    child: GradientText(
                                                      '${controller.listCounting[index]}',
                                                      gradient: LinearGradient(
                                                        colors: controller.initialPage.value == index
                                                            ? AppColors.gradiantColor
                                                            : [
                                                                controller.appColors.textColors,
                                                                controller.appColors.textColors,
                                                              ],
                                                        begin: Alignment.topCenter,
                                                        end: Alignment.bottomCenter,
                                                      ),
                                                      style: MyTextStyle(
                                                        textSize: controller.initialPage.value == index ? 22.sp : 18.sp,
                                                        textWeight: FontWeight.w600,
                                                      ),
                                                    ),
                                                  ),
                                                );
                                              },
                                            );
                                          },
                                          itemCount: controller.listCounting.length,
                                        ),
                                      )
                                    : Expanded(
                                        child: Container(
                                          alignment: Alignment.center,
                                          child: Column(
                                            mainAxisSize: MainAxisSize.min,
                                            children: [
                                              Row(
                                                mainAxisAlignment: MainAxisAlignment.center,
                                                crossAxisAlignment: CrossAxisAlignment.center,
                                                children: [
                                                  GradientText(
                                                    '${controller.selectedWeight}',
                                                    gradient: controller.utils.textGradiant,
                                                    style: MyTextStyle(
                                                      textSize: 24.sp,
                                                      textWeight: FontWeight.w600,
                                                    ),
                                                  ),
                                                  Container(
                                                    margin: EdgeInsets.only(top: 10.px, left: 5.px),
                                                    child: MyTextView(
                                                      Strings.kg,
                                                      isMaxLineWrap: true,
                                                      textAlignNew: TextAlign.start,
                                                      textStyleNew: MyTextStyle(
                                                        textSize: 18.px,
                                                        textColor: controller.appColors.appText.withOpacity(0.6),
                                                        textWeight: FontWeight.w600,
                                                      ),
                                                    ),
                                                  )
                                                ],
                                              ),
                                              VerticalWeightSlider(
                                                controller: controller.controllerWeight,
                                                isVertical: false,
                                                decoration: PointerDecoration(
                                                  width: 130.0.px,
                                                  height: 3.0.px,
                                                  largeColor: controller.appColors.grey,
                                                  mediumColor: const Color(0xFFC5C5C5),
                                                  smallColor: controller.appColors.appGray,
                                                  gap: 30.0,
                                                ),
                                                maxWeight: 100,
                                                onChanged: (double value) {
                                                  printWhite("---> ---> ---> $value");
                                                  controller.selectedWeight.value = value;
                                                  controller.update();
                                                },
                                                indicator: Container(
                                                    height: 8.px,
                                                    width: 150.0.px,
                                                    alignment: Alignment.centerLeft,
                                                    decoration: BoxDecoration(
                                                      gradient: LinearGradient(
                                                        colors: [
                                                          controller.appColors.btnStart,
                                                          controller.appColors.btnEnd,
                                                        ],
                                                        begin: Alignment.bottomRight,
                                                        end: Alignment.topLeft,
                                                        tileMode: TileMode.clamp,
                                                      ),
                                                      borderRadius: BorderRadius.circular(360),
                                                    )),
                                              ),
                                            ],
                                          ),
                                        ),
                                      )
                              ],
                            ));
                      },
                    );
                  },
                  itemCount: controller.listQuestion.length,
                ),
              ),
            ),
            SizedBox(
              width: double.infinity,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  GestureDetector(
                    onTap: () {
                      if (controller.currentCount.value < 2) {
                        controller.currentCount.value = controller.currentCount.value + 1;
                        controller.controllerCarousel.nextPage();
                        controller.update();
                      } else {
                        Get.toNamed(TabBarScreen.routes);
                      }
                    },
                    child: Image.asset(
                      ImagePath.nextArrow,
                      height: controller.appDimensions.btnHeight,
                      width: controller.appDimensions.btnHeight,
                    ),
                  ),
                  SizedBox(
                    height: 1.h,
                  ),
                  GestureDetector(
                    onTap: () {
                      if (controller.currentCount.value > 1) {
                        controller.currentCount.value = controller.currentCount.value - 1;
                        controller.controllerCarousel.previousPage();
                        controller.update();
                      } else {
                        Get.back();
                      }
                    },
                    child: Padding(
                      padding: EdgeInsets.symmetric(horizontal: 8.0.px, vertical: 4.px),
                      child: MyTextView(
                        Strings.back.toUpperCase(),
                        isMaxLineWrap: true,
                        textAlignNew: TextAlign.start,
                        textStyleNew: MyTextStyle(
                          textSize: 16.sp,
                          textColor: controller.appColors.appText,
                          textWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 2.5.h,
            ),
          ],
        ),
      );
    });
  }
}
