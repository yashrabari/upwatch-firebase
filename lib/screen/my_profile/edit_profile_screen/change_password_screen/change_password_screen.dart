import 'package:upwatch/screen/base_screen.dart';
import 'package:upwatch/screen/my_profile/edit_profile_screen/change_password_screen/change_password_controller.dart';

import '../../../../common/all.dart';
import '../../../../common/constants.dart';

class ChangePasswordScreen extends GetView<ChangePasswordController> {
  const ChangePasswordScreen({Key? key}) : super(key: key);
  static const routes = "/ChangePasswordScreen";

  @override
  Widget build(BuildContext context) {
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
              title: Strings.changePassword,
            ),
          ),
          Expanded(
            child: ListView(
              padding: EdgeInsets.zero,
              physics: BouncingScrollPhysics(),
              children: [
                Obx(() {
                  return CommonTextFieldWithTitle(
                    titleText: Strings.currentPassword,
                    hintText: Strings.hintCurrentPassword,
                    obscureText: controller.isPHide.value,
                    textInputAction: TextInputAction.next,
                    titleStyle: MyTextStyle(
                      textSize: 16.px,
                      textColor: controller.appColors.appText,
                      textFamily: AppFontFamily.GothamRounded,
                      textWeight: FontWeight.bold,
                    ),
                    hintTextStyle: MyTextStyle(
                      textSize: 16.px,
                      textColor: controller.appColors.buttonBackGroundColor.withOpacity(0.4),
                      textWeight: FontWeight.w400,
                    ),
                    textFieldStyle: MyTextStyle(
                      textSize: 16.px,
                      textColor: controller.appColors.buttonBackGroundColor,
                      textWeight: FontWeight.w400,
                    ),
                    controller: TextEditingController(),
                    isRightImage: true,
                    rightImage: (controller.isPHide.value ? ImagePath.eyeCross : ImagePath.eyeShow),
                    rightImageTap: () {
                      controller.isPHide.value = !controller.isPHide.value;
                      controller.update();
                    },
                  );
                }),
                Obx(() {
                  return CommonTextFieldWithTitle(
                      titleText: Strings.confirmPassword,
                      hintText: Strings.hintConfirmPassword,
                      obscureText: controller.isCPHide.value,
                      textInputAction: TextInputAction.done,
                      titleStyle: MyTextStyle(
                        textSize: controller.appDimensions.textFieldTitleText,
                        textColor: controller.appColors.appText,
                        textWeight: FontWeight.bold,
                      ),
                      hintTextStyle: MyTextStyle(
                        textSize: controller.appDimensions.textFieldHintText,
                        textColor: controller.appColors.buttonBackGroundColor.withOpacity(0.4),
                        textWeight: FontWeight.w400,
                      ),
                      textFieldStyle: MyTextStyle(
                        textSize: controller.appDimensions.textFieldText,
                        textColor: controller.appColors.buttonBackGroundColor,
                        textWeight: FontWeight.w400,
                      ),
                      controller: TextEditingController(),
                      isRightImage: true,
                      rightImage: (controller.isCPHide.value ? ImagePath.eyeCross : ImagePath.eyeShow),
                      rightImageTap: () {
                        controller.isCPHide.value = !controller.isCPHide.value;
                        controller.update();
                      });
                }),
                Obx(() {
                  return CommonTextFieldWithTitle(
                    titleText: Strings.confirmNewPassword,
                    hintText: Strings.hintConfirmNewPassword,
                    obscureText: controller.isCNPHide.value,
                    textInputAction: TextInputAction.done,
                    titleStyle: MyTextStyle(
                      textSize: controller.appDimensions.textFieldTitleText,
                      textColor: controller.appColors.appText,
                      textWeight: FontWeight.bold,
                    ),
                    hintTextStyle: MyTextStyle(
                      textSize: controller.appDimensions.textFieldHintText,
                      textColor: controller.appColors.buttonBackGroundColor.withOpacity(0.4),
                      textWeight: FontWeight.w400,
                    ),
                    textFieldStyle: MyTextStyle(
                      textSize: controller.appDimensions.textFieldText,
                      textColor: controller.appColors.buttonBackGroundColor,
                      textWeight: FontWeight.w400,
                    ),
                    controller: TextEditingController(),
                    isRightImage: true,
                    rightImage: (controller.isCNPHide.value ? ImagePath.eyeCross : ImagePath.eyeShow),
                    rightImageTap: () {
                      controller.isCNPHide.value = !controller.isCNPHide.value;
                      controller.update();
                    },
                  );
                }),
                SizedBox(height: 35.px),
                CommonButton(
                  onTap: () {
                    Get.back();
                  },
                  width: double.infinity,
                  height: controller.appDimensions.btnHeight,
                  textSize: controller.appDimensions.btnTextSize,
                  textWeight: FontWeight.bold,
                  title: Strings.update.toUpperCase(),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
