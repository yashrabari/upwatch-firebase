import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:upwatch/common/constants.dart';
import 'package:upwatch/screen/base_screen.dart';
import 'package:upwatch/screen/my_profile/medical_history_screen/medical_history_controller.dart';

import '../../../common/all.dart';

class MedicalHistoryScreen extends GetView<MedicalHistoryController> {
  const MedicalHistoryScreen({Key? key}) : super(key: key);
  static const routes = "/MedicalHistoryScreen";

  @override
  Widget build(BuildContext context) {
    Get.put(MedicalHistoryController());
    return GetBuilder<MedicalHistoryController>(
      assignId: true,
      builder: (logic) {
        return BaseScreen(
          child: Column(
            children: [
              Padding(
                padding: EdgeInsets.only(top: 3.5.h),
                child: CommonBackArrow(
                  backArrowTap: () {
                    Get.back();
                  },
                  isBack: true,
                  isTitle: true,
                  title: Strings.medicalHistory,
                ),
              ),
              Expanded(
                child: ListView(
                  padding: EdgeInsets.zero,
                  physics: BouncingScrollPhysics(),
                  children: [
                    MyTextView(
                      Strings.haveYouBeenDiagnosed,
                      maxLinesNew: 2,
                      textStyleNew: MyTextStyle(
                        textFamily: AppFontFamily.GothamRoundedMedium,
                        textSize: 19.sp,
                        textColor: controller.appColors.appText,
                        textWeight: FontWeight.w500,
                      ),
                    ),
                    SizedBox(height: 20.px),
                    ListView.builder(
                        shrinkWrap: true,
                        physics: NeverScrollableScrollPhysics(),
                        padding: EdgeInsets.zero,
                        itemCount: controller.listQuestion.length,
                        itemBuilder: (context, index) {
                          var tiles = [];
                          if (controller.listQuestion[index].listButton != null && controller.listQuestion[index].listButton!.length == 2) {
                            tiles.add(GridTile(2, 1, 0));
                            tiles.add(GridTile(2, 1, 0));
                          } else if (controller.listQuestion[index].listButton != null && controller.listQuestion[index].listButton!.length == 3) {
                            tiles.add(GridTile(2, 1, 0));
                            tiles.add(GridTile(2, 1, 0));
                            tiles.add(GridTile(4, 1, 1));
                          }
                          bool isIn = false;
                          return Column(
                            mainAxisSize: MainAxisSize.min,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SizedBox(height: 2.h),
                              MyTextView(
                                controller.listQuestion[index].title,
                                isMaxLineWrap: true,
                                textStyleNew: MyTextStyle(
                                  textFamily: AppFontFamily.GothamRoundedMedium,
                                  textSize: 16.px,
                                  textColor: AppColors().appText,
                                  textWeight: FontWeight.w500,
                                ),
                              ),
                              controller.listQuestion[index].identify == "selection"
                                  ? StaggeredGrid.count(
                                      crossAxisCount: 4,
                                      mainAxisSpacing: 2,
                                      crossAxisSpacing: 15,
                                      children: tiles.map((e) {
                                        printOkStatus("e --> --> --> $e");
                                        bool isFetch = false;
                                        if (!isIn) {
                                          isIn = true;
                                          isFetch = isIn;
                                        }
                                        return StaggeredGridTile.count(
                                          crossAxisCellCount: e.crossAxisCount,
                                          mainAxisCellCount: e.mainAxisCount,
                                          child: CommonCheckBox(
                                            onTap: () {
                                              for (int j = 0; j < controller.listQuestion[index].listButton!.length; j++) {
                                                controller.listQuestion[index].listButton![j].isSelected = false.obs;
                                              }
                                              controller
                                                  .listQuestion[index]
                                                  .listButton![e.position == 1
                                                      ? 2
                                                      : isIn && isFetch
                                                          ? 0
                                                          : 1]
                                                  .isSelected = true.obs;
                                              controller.update();
                                            },
                                            title: e.position == 1 ? controller.listQuestion[index].listButton![2].title : controller.listQuestion[index].listButton![isIn && isFetch ? 0 : 1].title,
                                            image: ImagePath.icSelect,
                                            isSelection: controller
                                                        .listQuestion[index]
                                                        .listButton![e.position == 1
                                                            ? 2
                                                            : isIn && isFetch
                                                                ? 0
                                                                : 1]
                                                        .isSelected !=
                                                    null
                                                ? controller
                                                    .listQuestion[index]
                                                    .listButton![e.position == 1
                                                        ? 2
                                                        : isIn && isFetch
                                                            ? 0
                                                            : 1]
                                                    .isSelected!
                                                    .value
                                                : false,
                                          ),
                                        );
                                      }).toList(),
                                    )
                                  : Column(
                                      children: [
                                        if (controller.listQuestion[index].identify.isEmpty)
                                          SizedBox(
                                            height: 1.h,
                                          ),
                                        CommonTextFieldWithTitle(
                                          titleText: "",
                                          hintText: '5',
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
                                          controller: TextEditingController(),
                                          // isHeight: true,
                                        ),
                                      ],
                                    ),
                            ],
                          );
                        }),
                    /*MedicalQuestion(title: Strings.highCholesterol, selectedValue: controller.selectedCholesterol.value),
                    MedicalQuestion(title: Strings.diabetes, selectedValue: controller.selectedDiabetes.value),
                    MedicalQuestion(title: Strings.highBloodPressure, selectedValue: controller.selectedBloodPressure.value),
                    MedicalQuestion(title: Strings.strokeHistory, selectedValue: controller.selectedStrokeHistory.value),
                    MedicalQuestion(title: Strings.alcoholStatus, selectedValue: controller.selectedAlcohol),
                    Obx(() {
                      return GestureDetector(
                        onTap: () {
                          if (controller.alcoholStatus.value) {
                            controller.selectedAlcohol = -1;
                            controller.alcoholStatus.value = false;
                          } else {
                            controller.alcoholStatus.value = true;
                          }
                          controller.update();
                        },
                        child: Container(
                          padding: EdgeInsets.symmetric(horizontal: 3.w),
                          height: 55.px,
                          width: double.infinity,
                          decoration: BoxDecoration(
                            color: controller.appColors.appText.withOpacity(0.05),
                            borderRadius: BorderRadius.circular(1.2.h),
                          ),
                          child: Row(
                            children: [
                              MyTextView(
                                Strings.noButIUsedDrink,
                                textStyleNew: MyTextStyle(
                                  textSize: 16.sp,
                                  textWeight: FontWeight.w500,
                                  textColor: AppColors().textColors,
                                ),
                              ),
                              Spacer(),
                              Container(
                                padding: EdgeInsets.all(5),
                                height: 22,
                                width: 22,
                                decoration: BoxDecoration(
                                  gradient: controller.alcoholStatus == true ? Utils().textGradiant : null,
                                  shape: BoxShape.circle,
                                  border: controller.alcoholStatus == true
                                      ? null
                                      : Border.all(
                                          color: AppColors().textColors,
                                        ),
                                ),
                                child: Container(
                                  decoration: BoxDecoration(
                                    color: controller.alcoholStatus == true ? Colors.white : null,
                                    shape: BoxShape.circle,
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                      );
                    }),
                    CommonTextFieldWithTitle(
                      maxLinesNew: 2,
                      titleText: Strings.weeklyAlcoholIntake,
                      hintText: "5",
                      inputType: TextInputType.number,
                      textInputAction: TextInputAction.next,

                      titleStyle: MyTextStyle(
                        textSize: AppDimensions().textFieldTitleText,
                        textColor: controller.appColors.appText,
                        textWeight: FontWeight.bold,
                      ),
                      hintTextStyle: MyTextStyle(
                        textSize: AppDimensions().textFieldHintText,
                        textColor: controller.appColors.buttonBackGroundColor.withOpacity(0.6),
                        textWeight: FontWeight.w400,
                      ),
                      textFieldStyle: MyTextStyle(
                        textSize: AppDimensions().textFieldText,
                        textColor: controller.appColors.buttonBackGroundColor,
                        textWeight: FontWeight.w400,
                      ),
                      controller: controller.alcoholUnit,
                      // isHeight: true,
                    ),
                    SizedBox(height: 2.h),
                    MedicalQuestion(title: Strings.smokingStatus, selectedValue: controller.selectedSmoke),
                    Obx(() {
                      return GestureDetector(
                        onTap: () {
                          if (controller.smokeStatus.value == true) {
                            controller.smokeStatus.value = false;
                          } else {
                            controller.smokeStatus.value = true;
                          }
                        },
                        child: Container(
                          padding: EdgeInsets.symmetric(horizontal: 20.px),
                          height: 55.px,
                          width: double.infinity,
                          decoration: BoxDecoration(
                            color: controller.appColors.appText.withOpacity(0.05),
                            borderRadius: BorderRadius.circular(1.2.h),
                          ),
                          child: Row(
                            children: [
                              MyTextView(
                                Strings.noButIUsedSmoke,
                                textStyleNew: MyTextStyle(
                                  textSize: 16.sp,
                                  textWeight: FontWeight.w500,
                                  textColor: AppColors().textColors,
                                ),
                              ),
                              Spacer(),
                              Container(
                                padding: EdgeInsets.all(5),
                                height: 22,
                                width: 22,
                                decoration: BoxDecoration(
                                  gradient: controller.alcoholStatus.value ? Utils().textGradiant : null,
                                  shape: BoxShape.circle,
                                  border: controller.alcoholStatus.value
                                      ? null
                                      : Border.all(
                                          color: AppColors().textColors,
                                        ),
                                ),
                                child: Container(
                                    decoration: BoxDecoration(
                                  color: controller.alcoholStatus == true ? Colors.white : null,
                                  shape: BoxShape.circle,
                                )),
                              )
                            ],
                          ),
                        ),
                      );
                    }),
                    CommonTextFieldWithTitle(
                      maxLinesNew: 2,
                      titleText: Strings.weeklyTobaccoIntake,
                      hintText: "5",
                      textInputAction: TextInputAction.next,
                      inputType: TextInputType.number,
                      titleStyle: MyTextStyle(
                        textSize: AppDimensions().textFieldTitleText,
                        textColor: controller.appColors.appText,
                        textWeight: FontWeight.bold,
                      ),
                      hintTextStyle: MyTextStyle(
                        textSize: AppDimensions().textFieldHintText,
                        textColor: controller.appColors.buttonBackGroundColor.withOpacity(0.6),
                        textWeight: FontWeight.w400,
                      ),
                      textFieldStyle: MyTextStyle(
                        textSize: AppDimensions().textFieldText,
                        textColor: controller.appColors.buttonBackGroundColor,
                        textWeight: FontWeight.w400,
                      ),
                      controller: controller.tobaccoUnit,
                      // isHeight: true,
                    ),*/
                    SizedBox(height: 5.h),
                    CommonButton(
                      onTap: () {
                        Get.back();
                      },
                      width: double.infinity,
                      height: AppDimensions().btnHeight,
                      textSize: AppDimensions().btnTextSize,
                      textWeight: FontWeight.bold,
                      title: Strings.save.toUpperCase(),
                    ),
                    SizedBox(height: 2.h),
                  ],
                ),
              )
            ],
          ),
        );
      },
    );
  }
}

class GridTile {
  const GridTile(this.crossAxisCount, this.mainAxisCount, this.position);

  final int crossAxisCount;
  final int mainAxisCount;
  final int position;
}
