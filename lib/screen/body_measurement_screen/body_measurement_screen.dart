import 'package:upwatch/Widget/custom_appbar.dart';
import 'package:upwatch/common/all.dart';
import 'package:upwatch/common/constants.dart';
import 'package:upwatch/screen/body_measurement_screen/body_measurement_controller.dart';

class BodyMeasurementScreen extends GetView<BodyMeasurementController> {
  static const routes = "/BodyMeasurementScreen";

  @override
  Widget build(BuildContext context) {
    Get.put(BodyMeasurementController());
    return GestureDetector(
      onTap: () => Utils().hideKeyboard(),
      child: Scaffold(
        appBar: CustomAppBar(
          isLeading: true,
        ),
        body: ListView(
          physics: BouncingScrollPhysics(),
          padding: EdgeInsets.symmetric(horizontal: AppDimensions().horizontalWholeApp),
          children: [
            SizedBox(height: 2.h),
            MyTextView(
              Strings.bodyMeasurement,
              isMaxLineWrap: true,
              textStyleNew: MyTextStyle(
                textFamily: AppFontFamily.GothamRoundedMedium,
                textSize: 23.sp,
                textColor: controller.appColors.appText,
                textWeight: FontWeight.w500,
              ),
            ),
            SizedBox(height: 2.h),
            CommonTextFieldWithTitle(
              titleText: Strings.bodyHeight,
              hintText: "165cm",
              textInputAction: TextInputAction.next,
              inputType: TextInputType.emailAddress,
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
              controller: controller.bodyHeightController,
              // isHeight: true,
            ),
            CommonTextFieldWithTitle(
              titleText: Strings.bodyWeight,
              hintText: "90Kg",
              textInputAction: TextInputAction.next,
              inputType: TextInputType.emailAddress,
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
              controller: controller.bodyWeightController,
              // isHeight: true,
            ),
            SizedBox(height: 6.h),
            CommonButton(
              onTap: () {
                Get.back();
              },
              width: double.infinity,
              height: AppDimensions().btnHeight,
              textSize: AppDimensions().btnTextSize,
              textWeight: FontWeight.bold,
              title: Strings.save.toUpperCase(),
            )
          ],
        ),
      ),
    );
  }
}
