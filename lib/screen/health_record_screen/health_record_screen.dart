import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:upwatch/Widget/custom_appbar.dart';
import 'package:upwatch/Widget/custom_switch_tile.dart';
import 'package:upwatch/common/app_dimensions.dart';
import 'package:upwatch/common/common_widget.dart';
import 'package:upwatch/common/constants.dart';
import 'package:upwatch/common/strings.dart';
import 'package:upwatch/screen/health_record_screen/health_record_controller.dart';

class HealthRecordScreen extends GetView<HealthRecordController> {
  static const routes = "/HealthRecordScreen";

  @override
  Widget build(BuildContext context) {
    Get.put(HealthRecordController());
    return GetBuilder<HealthRecordController>(
      assignId: true,
      builder: (logic) {
        return Scaffold(
          appBar: CustomAppBar(
            isLeading: true,
          ),
          body: ListView(
            physics: BouncingScrollPhysics(),
            padding: EdgeInsets.symmetric(
              horizontal: AppDimensions().horizontalWholeApp,
            ),
            children: [
              SizedBox(height: 2.h),
              MyTextView(
                Strings.healthDataRecordSetting,
                isMaxLineWrap: true,
                textStyleNew: MyTextStyle(
                  textFamily: AppFontFamily.GothamRoundedMedium,
                  textSize: 26.px,
                  textColor: controller.appColors.appText,
                  textWeight: FontWeight.w500,
                ),
              ),
              SizedBox(height: 5.h),
              CustomSwitchTile(
                isSwitch: controller.isSwitch.value,
                title: Strings.bloodGlucose,
              ),
              CustomSwitchTile(
                isSwitch: controller.isSwitch.value,
                title: Strings.bloodOxygen,
              ),
              CustomSwitchTile(
                isSwitch: controller.isSwitch.value,
                title: Strings.bloodPressure,
              ),
              CustomSwitchTile(
                isSwitch: controller.isSwitch.value,
                title: Strings.bloodBodyTemperature,
              ),
              CustomSwitchTile(
                isSwitch: controller.isSwitch.value,
                title: Strings.bodyWeight,
              ),
              SizedBox(height: 4.h),
              CommonButton(
                onTap: () {
                  Get.back();
                },
                width: double.infinity,
                height: AppDimensions().btnHeight,
                textSize: AppDimensions().btnTextSize,
                textWeight: FontWeight.bold,
                title: Strings.done.toUpperCase(),
              )
            ],
          ),
        );
      },
    );
  }
}
