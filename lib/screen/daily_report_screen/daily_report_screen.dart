import 'package:syncfusion_flutter_datepicker/datepicker.dart';
import 'package:upwatch/screen/tabbar_screen/tabbar_screen.dart';

import '../../common/all.dart';
import '../base_screen.dart';
import 'daily_report_controller.dart';

class DailyReportScreen extends GetView<DailyReportController> {
  const DailyReportScreen({Key? key}) : super(key: key);
  static const routes = "/DailyReportScreen";

  @override
  Widget build(BuildContext context) {
    return GetBuilder<DailyReportController>(
      builder: (logic) {
        return BaseScreen(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.only(top: 3.5.h),
                child: CommonBackArrow(
                  backArrowTap: () {
                    Get.back();
                  },
                  isBack: true,
                  isTitle: true,
                  isTitleSpace: false,
                  title: Strings.dailyReport,
                ),
              ),
              Row(
                children: [
                  GestureDetector(
                    onTap: () {
                      dateBottomSheet(context);
                    },
                    child: Container(
                      color: Colors.transparent,
                      child: Wrap(
                        crossAxisAlignment: WrapCrossAlignment.center,
                        children: [
                          Obx(() {
                            return MyTextView(
                              controller.date.value.isEmpty
                                  ? controller.toDayDate
                                  : controller.date.value,
                              isMaxLineWrap: true,
                              textAlignNew: TextAlign.center,
                              textStyleNew: MyTextStyle(
                                textSize: 16.sp,
                                textColor: controller.appColors.appText,
                                textWeight: FontWeight.w300,
                              ),
                            );
                          }),
                          Container(
                            margin: EdgeInsets.symmetric(horizontal: 6.px),
                            alignment: Alignment.center,
                            child: Image.asset(
                              ImagePath.downArrow,
                              height: 1.h,
                              width: 4.w,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 2.h),
              Expanded(
                child: ListView(
                  shrinkWrap: true,
                  padding: EdgeInsets.zero,
                  physics: BouncingScrollPhysics(),
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        CommonTextFieldWithTitle(
                          titleText: Strings.bloodGlucose,
                          hintText: Strings.hintBloodGlucose,
                          textInputAction: TextInputAction.next,
                          inputType: TextInputType.text,
                          titleStyle: MyTextStyle(
                            textSize:
                                controller.appDimensions.textFieldTitleText,
                            textColor: controller.appColors.appText,
                            textWeight: FontWeight.bold,
                          ),
                          hintTextStyle: MyTextStyle(
                            textSize:
                                controller.appDimensions.textFieldHintText,
                            textColor: controller
                                .appColors.buttonBackGroundColor
                                .withOpacity(0.60),
                            textWeight: FontWeight.w400,
                          ),
                          textFieldStyle: MyTextStyle(
                            textSize: controller.appDimensions.textFieldText,
                            textColor:
                                controller.appColors.buttonBackGroundColor,
                            textWeight: FontWeight.w400,
                          ),
                          controller: controller.controllerBloodGlucose,
                          // isHeight: true,
                        ),
                        Container(
                          margin: EdgeInsets.only(
                              top: controller.appDimensions.topSpaceTextField),
                          child: CommonTextFieldWithTitle(
                            titleText: Strings.bloodOxygen,
                            hintText: Strings.hintBloodOxygen,
                            inputType: TextInputType.text,
                            textInputAction: TextInputAction.next,
                            titleStyle: MyTextStyle(
                              textSize:
                                  controller.appDimensions.textFieldTitleText,
                              textColor: controller.appColors.appText,
                              textWeight: FontWeight.bold,
                            ),
                            hintTextStyle: MyTextStyle(
                              textSize:
                                  controller.appDimensions.textFieldHintText,
                              textColor: controller
                                  .appColors.buttonBackGroundColor
                                  .withOpacity(0.60),
                              textWeight: FontWeight.w400,
                            ),
                            textFieldStyle: MyTextStyle(
                              textSize: controller.appDimensions.textFieldText,
                              textColor:
                                  controller.appColors.buttonBackGroundColor,
                              textWeight: FontWeight.w400,
                            ),
                            controller: controller.controllerBloodOxygen,
                            // isHeight: true,
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(
                              top: controller.appDimensions.topSpaceTextField),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SizedBox(height: 1.0.h),
                              Padding(
                                padding: EdgeInsets.symmetric(vertical: 5.0.px),
                                child: CommonMediumText(
                                    title: Strings.bloodPressure,
                                    textStyle: MyTextStyle(
                                      textSize: controller
                                          .appDimensions.textFieldTitleText,
                                      textColor: controller.appColors.appText,
                                      textWeight: FontWeight.bold,
                                    )),
                              ),
                              Row(
                                children: [
                                  Expanded(
                                    child: CommonTextFieldWithTitle(
                                      titleText: "",
                                      hintText: Strings.systolic,
                                      textInputAction: TextInputAction.next,
                                      titleStyle: MyTextStyle(
                                        textSize: controller
                                            .appDimensions.textFieldTitleText,
                                        textColor: controller.appColors.appText,
                                        textWeight: FontWeight.bold,
                                      ),
                                      hintTextStyle: MyTextStyle(
                                        textSize: controller
                                            .appDimensions.textFieldHintText,
                                        textColor: controller.appColors
                                            .buttonBackGroundColor /*.withOpacity(0.60)*/,
                                        textWeight: FontWeight.w400,
                                      ),
                                      textFieldStyle: MyTextStyle(
                                        textSize: controller
                                            .appDimensions.textFieldText,
                                        textColor: controller
                                            .appColors.buttonBackGroundColor,
                                        textWeight: FontWeight.w400,
                                      ),
                                      controller:
                                          controller.controllerBPSystolic,
                                      // isHeight: true,
                                    ),
                                  ),
                                  SizedBox(
                                    width: 3.w,
                                  ),
                                  Expanded(
                                    child: CommonTextFieldWithTitle(
                                      titleText: "",
                                      hintText: Strings.diastolic,
                                      textInputAction: TextInputAction.next,
                                      titleStyle: MyTextStyle(
                                        textSize: controller
                                            .appDimensions.textFieldTitleText,
                                        textColor: controller.appColors.appText,
                                        textWeight: FontWeight.bold,
                                      ),
                                      hintTextStyle: MyTextStyle(
                                        textSize: controller
                                            .appDimensions.textFieldHintText,
                                        textColor: controller.appColors
                                            .buttonBackGroundColor /*.withOpacity(0.60)*/,
                                        textWeight: FontWeight.w400,
                                      ),
                                      textFieldStyle: MyTextStyle(
                                        textSize: controller
                                            .appDimensions.textFieldText,
                                        textColor: controller
                                            .appColors.buttonBackGroundColor,
                                        textWeight: FontWeight.w400,
                                      ),
                                      controller:
                                          controller.controllerBPDiastolic,
                                      // isHeight: true,
                                    ),
                                  )
                                ],
                              ),
                            ],
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(
                              top: controller.appDimensions.topSpaceTextField),
                          child: CommonTextFieldWithTitle(
                            titleText: Strings.bloodBodyTemperature,
                            hintText: Strings.hintBodyTemperature,
                            textInputAction: TextInputAction.next,
                            titleStyle: MyTextStyle(
                              textSize:
                                  controller.appDimensions.textFieldTitleText,
                              textColor: controller.appColors.appText,
                              textWeight: FontWeight.bold,
                            ),
                            hintTextStyle: MyTextStyle(
                              textSize:
                                  controller.appDimensions.textFieldHintText,
                              textColor: controller
                                  .appColors.buttonBackGroundColor
                                  .withOpacity(0.60),
                              textWeight: FontWeight.w400,
                            ),
                            textFieldStyle: MyTextStyle(
                              textSize: controller.appDimensions.textFieldText,
                              textColor:
                                  controller.appColors.buttonBackGroundColor,
                              textWeight: FontWeight.w400,
                            ),
                            controller: controller.controllerBodyTemp,
                            // isHeight: true,
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(
                              top: controller.appDimensions.topSpaceTextField),
                          child: CommonTextFieldWithTitle(
                            titleText: Strings.bloodBodyWeight,
                            hintText: Strings.hintBodyWeight,
                            textInputAction: TextInputAction.done,
                            titleStyle: MyTextStyle(
                              textSize:
                                  controller.appDimensions.textFieldTitleText,
                              textColor: controller.appColors.appText,
                              textWeight: FontWeight.bold,
                            ),
                            hintTextStyle: MyTextStyle(
                              textSize:
                                  controller.appDimensions.textFieldHintText,
                              textColor: controller
                                  .appColors.buttonBackGroundColor
                                  .withOpacity(0.60),
                              textWeight: FontWeight.w400,
                            ),
                            textFieldStyle: MyTextStyle(
                              textSize: controller.appDimensions.textFieldText,
                              textColor:
                                  controller.appColors.buttonBackGroundColor,
                              textWeight: FontWeight.w400,
                            ),
                            controller: controller.controllerBodyWeight,
                            // isHeight: true,
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(top: 4.h),
                          child: CommonButton(
                            onTap: () {
                              controller.saveDailyReport();
                              Get.offAllNamed(TabBarScreen.routes);
                            },
                            width: double.infinity,
                            height: controller.appDimensions.btnHeight,
                            textSize: controller.appDimensions.btnTextSize,
                            textWeight: FontWeight.bold,
                            title: Strings.done.toUpperCase(),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              SizedBox(height: 2.h)
            ],
          ),
        );
      },
    );
  }

  dateBottomSheet(context) {
    showModalBottomSheet(
      context: context,
      backgroundColor: Colors.transparent,
      isScrollControlled: true,
      builder: (BuildContext context) {
        return CommonBottomSheet(
          borderRadius: 20.px,
          bottomSheetColor: controller.appColors.white,
          widget: Padding(
            padding: EdgeInsets.symmetric(
                horizontal: controller.appDimensions.horizontalWholeApp),
            child: Column(
              children: [
                Padding(
                  padding: EdgeInsets.symmetric(vertical: 20.px),
                  child: MyTextView(
                    Strings.dailyReport,
                    isMaxLineWrap: true,
                    textAlignNew: TextAlign.center,
                    textStyleNew: MyTextStyle(
                      textSize: 18.sp,
                      textColor: controller.appColors.appText,
                      textWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 10.px),
                  child: SfDateRangePicker(
                    onSelectionChanged: (dateRangePickerSelectionChangedArgs) {
                      printWarning(
                          "dateRangePickerSelectionChangedArgs ------------ ${dateRangePickerSelectionChangedArgs.value}");
                      controller.date.value = controller.utils.changeDateFormat(
                        date: dateRangePickerSelectionChangedArgs.value,
                        outputFormat: ("d MMM yyyy"),
                      );
                      printOkStatus("Date -------> ${controller.date.value}");
                    },
                    selectionMode: DateRangePickerSelectionMode.single,
                    allowViewNavigation: true,
                    showNavigationArrow: true,
                    maxDate: DateTime.now(),
                    view: DateRangePickerView.month,
                    selectionColor:
                        controller.appColors.appOrange2.withOpacity(0.5),
                    todayHighlightColor: controller.appColors.appOrange2,
                    enablePastDates: true,
                    headerStyle: DateRangePickerHeaderStyle(
                      textStyle: MyTextStyle(
                        textSize: 16.sp,
                        textColor: controller.appColors.btnEnd,
                        textWeight: FontWeight.w500,
                      ),
                    ),
                    monthViewSettings: DateRangePickerMonthViewSettings(
                      showTrailingAndLeadingDates: true,
                      weekNumberStyle: DateRangePickerWeekNumberStyle(
                        textStyle: MyTextStyle(
                          textSize: 16.sp,
                          textColor: controller.appColors.black,
                          textWeight: FontWeight.normal,
                        ),
                      ),
                    ),
                    monthCellStyle: DateRangePickerMonthCellStyle(
                        textStyle: MyTextStyle(
                          textSize: 16.sp,
                          textColor: controller.appColors.black,
                          textWeight: FontWeight.normal,
                        ),
                        leadingDatesTextStyle: MyTextStyle(
                          textSize: 16.sp,
                          textColor: controller.appColors.textColors,
                          textWeight: FontWeight.normal,
                        ),
                        trailingDatesTextStyle: MyTextStyle(
                          textSize: 16.sp,
                          textColor: controller.appColors.textColors,
                          textWeight: FontWeight.normal,
                        ),
                        todayTextStyle: MyTextStyle(
                          textSize: 16.sp,
                          textColor: controller.appColors.appOrange2,
                          textWeight: FontWeight.normal,
                        )),
                    initialSelectedRange: PickerDateRange(
                      DateTime.now().subtract(const Duration(days: 4)),
                      DateTime.now().add(
                        const Duration(days: 3),
                      ),
                    ),
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(top: 4.h),
                  child: CommonButton(
                    onTap: () {
                      Get.back();
                    },
                    width: double.infinity,
                    height: controller.appDimensions.btnHeight,
                    textSize: controller.appDimensions.btnTextSize,
                    textWeight: FontWeight.bold,
                    title: Strings.ok.toUpperCase(),
                  ),
                ),
                SizedBox(height: 2.h),
              ],
            ),
          ),
        );
      },
    );
  }
}
