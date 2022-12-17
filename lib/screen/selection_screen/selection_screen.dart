import 'package:carousel_slider/carousel_slider.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';
import 'package:upwatch/common/all.dart';
import 'package:upwatch/common/constants.dart';

import '../base_screen.dart';
import '../medical_screen/medical_screen.dart';
import 'selection_controller.dart';

class SelectionScreen extends GetView<SelectionController> {
  const SelectionScreen({Key? key}) : super(key: key);
  static const routes = "/SelectionScreen";

  @override
  Widget build(BuildContext context) {
    return GetBuilder<SelectionController>(builder: (logic) {
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
                    percent: /*0.1*/ (controller.currentCount.value / 6),
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
                Strings.stepCount("${controller.currentCount.value}", "6").toUpperCase(),
                isMaxLineWrap: true,
                textAlignNew: TextAlign.center,
                textStyleNew: MyTextStyle(
                  textSize: 15.sp,
                  textColor: controller.appColors.appText.withOpacity(0.6),
                  textWeight: FontWeight.w600,
                  textFamily: AppFontFamily.GothamRounded,
                ),
              ),
            ),
            Expanded(
              child: SizedBox(
                width: double.infinity,
                child: CarouselSlider(
                  carouselController: controller.controllerCarousel,
                  options: CarouselOptions(
                    height: 100.h,
                    viewportFraction: 1.0,
                    enlargeCenterPage: false,
                    enableInfiniteScroll: false,
                    scrollPhysics: const NeverScrollableScrollPhysics(),
                  ),
                  items: controller.listQuestion.map((i) {
                    return Container(
                      width: MediaQuery.of(context).size.width,
                      margin: EdgeInsets.symmetric(vertical: 20.px),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          MyTextView(
                            i.title,
                            isMaxLineWrap: true,
                            textAlignNew: TextAlign.start,
                            textStyleNew: MyTextStyle(
                              textSize: 18.sp,
                              textColor: controller.appColors.appText,
                              textWeight: FontWeight.w600,
                              textFamily: AppFontFamily.GothamRounded,
                            ),
                          ),
                          i.subTitle != null && i.subTitle.isNotEmpty
                              ? Container(
                                  margin: EdgeInsets.symmetric(vertical: 8.px),
                                  alignment: Alignment.topLeft,
                                  child: MyTextView(
                                    i.subTitle,
                                    isMaxLineWrap: true,
                                    textAlignNew: TextAlign.start,
                                    textStyleNew: MyTextStyle(
                                      textSize: 16.sp,
                                      textColor: controller.appColors.appText,
                                      textWeight: FontWeight.normal,
                                    ),
                                  ),
                                )
                              : const SizedBox(),
                          i.identify.isEmpty
                              ? Column(
                                  children: [
                                    if (i.subTitle.isEmpty)
                                      SizedBox(
                                        height: 1.h,
                                      ),
                                    CommonTextFieldWithTitle(
                                      titleText: "",
                                      hintText: Strings.enterNumber,
                                      inputType: TextInputType.number,
                                      textInputAction: TextInputAction.done,
                                      titleStyle: MyTextStyle(
                                        textSize: controller.appDimensions.textFieldTitleText,
                                        textColor: controller.appColors.appText,
                                        textWeight: FontWeight.bold,
                                      ),
                                      hintTextStyle: MyTextStyle(
                                        textSize: controller.appDimensions.textFieldHintText,
                                        textColor: controller.appColors.buttonBackGroundColor.withOpacity(0.6),
                                        textWeight: FontWeight.w400,
                                      ),
                                      textFieldStyle: MyTextStyle(
                                        textSize: controller.appDimensions.textFieldText,
                                        textColor: controller.appColors.buttonBackGroundColor,
                                        textWeight: FontWeight.w400,
                                      ),
                                      controller: controller.controllerEmail,
                                      // isHeight: true,
                                    ),
                                  ],
                                )
                              : ListView.builder(
                                  itemCount: i.listButton != null ? i.listButton!.length : 0,
                                  padding: EdgeInsets.zero,
                                  shrinkWrap: true,
                                  physics: NeverScrollableScrollPhysics(),
                                  itemBuilder: (mContext, position) {
                                    return CommonCheckBox(
                                      onTap: () {
                                        // controller.isYes.value = !controller.isYes.value;
                                        for (int j = 0; j < i.listButton!.length; j++) {
                                          i.listButton![j].isSelected = false.obs;
                                        }
                                        i.listButton![position].isSelected = true.obs;
                                        controller.update();
                                      },
                                      title: i.listButton![position].title,
                                      isSelection: i.listButton![position].isSelected != null ? i.listButton![position].isSelected!.value : false,
                                    );
                                  },
                                )
                        ],
                      ),
                    );
                  }).toList(),
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
                      if (controller.currentCount.value == 5 && controller.is5Sub.value) {
                        controller.currentCount.value = controller.currentCount.value + 1;
                        controller.controllerCarousel.nextPage();
                        controller.update();
                      } else if (controller.currentCount.value == 5 && !controller.is5Sub.value) {
                        controller.controllerCarousel.nextPage();
                        controller.is5Sub.value = true;
                        controller.update();
                      } else if (controller.currentCount.value < 6 && (!controller.is5Sub.value)) {
                        controller.currentCount.value = controller.currentCount.value + 1;
                        controller.controllerCarousel.nextPage();
                        controller.update();
                      } else if (controller.currentCount.value == 6 && (!controller.is6Sub.value)) {
                        controller.controllerCarousel.nextPage();
                        controller.is6Sub.value = true;
                        controller.update();
                      } else if (controller.currentCount.value == 6 && (controller.is6Sub.value)) {
                        Get.offAllNamed(MedicalScreen.routes, arguments: ["true"]);
                      }
                      printOkStatus("text--${controller.currentCount.value}---${controller.is5Sub.value}");
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
                      if (controller.currentCount.value == 6 && (controller.is6Sub.value)) {
                        // controller.currentCount.value = controller.currentCount.value - 1;
                        controller.controllerCarousel.previousPage();
                        controller.is6Sub.value = false;
                        controller.update();
                      } else if (controller.currentCount.value == 5 && controller.is5Sub.value) {
                        controller.controllerCarousel.previousPage();
                        controller.is5Sub.value = false;
                        controller.update();
                      } else if (controller.currentCount.value > 1) {
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
              height: 2.h,
            ),
          ],
        ),
      );
    });
  }
}
