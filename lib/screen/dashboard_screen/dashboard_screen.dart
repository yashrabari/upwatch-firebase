import 'package:upwatch/Widget/custom_appbar.dart';
import 'package:upwatch/Widget/custom_switch_tile.dart';
import 'package:upwatch/common/all.dart';
import 'package:upwatch/common/constants.dart';
import 'package:upwatch/common/gradiant_app_text.dart';
import 'package:upwatch/screen/dashboard_screen/dashboard_controller.dart';

class DashboardSettingScreen extends GetView<DashboardSettingController> {
  static const routes = "/DashboardSettingScreen";

  @override
  Widget build(BuildContext context) {
    Get.put(DashboardSettingController());
    return Scaffold(
      appBar: CustomAppBar(
        isLeading: true,
      ),
      body: ListView(
        physics: BouncingScrollPhysics(),
        padding: EdgeInsets.symmetric(horizontal: AppDimensions().horizontalWholeApp),
        children: [
          SizedBox(height: 2.h),
          MyTextView(
            Strings.dashboardSetting,
            textStyleNew: MyTextStyle(
              textFamily: AppFontFamily.GothamRoundedMedium,
              textSize: 26.px,
              textColor: controller.appColors.appText,
              textWeight: FontWeight.w500,
            ),
          ),
          SizedBox(height: 30.px),
          GradientText(
            gradient: controller.utils.textGradiant,
            Strings.healthData,
            style: MyTextStyle(
              textFamily: AppFontFamily.GothamRoundedMedium,
              textSize: 22.px,
              textColor: controller.appColors.appText,
              textWeight: FontWeight.w700,
            ),
          ),
          SizedBox(height: 2.h),
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
          SizedBox(height: 20.px),
          GradientText(
            gradient: controller.utils.textGradiant,
            Strings.mobilityScores,
            style: MyTextStyle(
              textFamily: AppFontFamily.GothamRoundedMedium,
              textSize: 22.px,
              textColor: controller.appColors.appText,
              textWeight: FontWeight.w700,
            ),
          ),
          SizedBox(height: 2.h),
          CustomSwitchTile(
            isSwitch: controller.isSwitch.value,
            title: Strings.totalCompositeScore,
          ),
          CustomSwitchTile(
            isSwitch: controller.isSwitch.value,
            title: Strings.physicalActivityLevel,
          ),
          CustomSwitchTile(
            isSwitch: controller.isSwitch.value,
            title: Strings.walkingSpeed,
          ),
          CustomSwitchTile(
            isSwitch: controller.isSwitch.value,
            title: Strings.walkingQuality,
          ),
          CustomSwitchTile(
            isSwitch: controller.isSwitch.value,
            title: Strings.walkingPerformanceProgress,
          ),
          SizedBox(height: 20.px),
          GradientText(
            gradient: controller.utils.textGradiant,
            Strings.diseaseRisk,
            style: MyTextStyle(
              textFamily: AppFontFamily.GothamRoundedMedium,
              textSize: 22.px,
              textColor: controller.appColors.appText,
              textWeight: FontWeight.w700,
            ),
          ),
          SizedBox(height: 2.h),
          CustomSwitchTile(
            isSwitch: controller.isSwitch.value,
            title: Strings.fallRisk,
          ),
          CustomSwitchTile(
            isSwitch: controller.isSwitch.value,
            title: Strings.strokeRisk,
          ),
          CustomSwitchTile(
            isSwitch: controller.isSwitch.value,
            title: Strings.dementiaRisk,
          ),
          CustomSwitchTile(
            isSwitch: controller.isSwitch.value,
            title: Strings.pakinsonRisk,
          ),
          SizedBox(height: 3.h),
          CommonButton(
            onTap: () {
              Get.back();
            },
            width: double.infinity,
            height: AppDimensions().btnHeight,
            textSize: AppDimensions().btnTextSize,
            textWeight: FontWeight.bold,
            title: Strings.done.toUpperCase(),
          ),
          SizedBox(height: 2.h),
        ],
      ),
    );
  }
}
