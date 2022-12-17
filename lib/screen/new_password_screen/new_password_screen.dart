import 'package:upwatch/common/all.dart';
import 'package:upwatch/screen/new_password_screen/new_password_controller.dart';

import '../base_screen.dart';
import '../login_screen/login_screen.dart';

class NewPasswordScreen extends GetView<NewPasswordController> {
  const NewPasswordScreen({Key? key}) : super(key: key);
  static const routes = "/NewPasswordScreen";

  @override
  Widget build(BuildContext context) {
    return BaseScreen(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.only(top: 3.5.h),
            child: CommonBackArrow(backArrowTap: () {
              Get.back();
            }),
          ),
          Expanded(
            child: SizedBox(
              width: double.infinity,
              child: ListView(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset(
                        ImagePath.forgotPassword,
                        width: controller.appDimensions.forgotImageSize,
                      ),
                    ],
                  ),
                  Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Container(
                        margin: EdgeInsets.only(bottom: 2.h, top: 6.h),
                        child: MyTextView(
                          Strings.createNewPassword,
                          isMaxLineWrap: true,
                          textStyleNew: MyTextStyle(
                            textSize: 22.sp,
                            textColor: controller.appColors.appText,
                            textWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      MyTextView(
                        Strings.yourNewPassword,
                        isMaxLineWrap: true,
                        textAlignNew: TextAlign.center,
                        textStyleNew: MyTextStyle(
                          textSize: 17.sp,
                          textColor: controller.appColors.appText,
                          textWeight: FontWeight.w100,
                        ),
                      ),
                    ],
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 4.h),
                    child: CommonTextFieldWithTitle(
                      titleText: Strings.newPassword,
                      hintText: Strings.hintNewPassword,
                      textInputAction: TextInputAction.next,
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
                      obscureText: true,
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(
                      top: controller.appDimensions.topSpaceTextField,
                      bottom: controller.appDimensions.btnTopMargin,
                    ),
                    child: CommonTextFieldWithTitle(
                      titleText: Strings.confirmPassword,
                      hintText: Strings.hintConfirmPassword,
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
                      controller: controller.controllerNewPassword,
                      obscureText: true,
                    ),
                  ),
                  CommonButton(
                    onTap: () {
                      Get.offAllNamed(LoginScreen.routes);
                    },
                    width: double.infinity,
                    height: controller.appDimensions.btnHeight,
                    textSize: controller.appDimensions.btnTextSize,
                    textWeight: FontWeight.bold,
                    title: Strings.save.toUpperCase(),
                  ),
                ],
              ),
            ),
          ),
          SizedBox(
            height: 2.h,
          ),
        ],
      ),
    );
  }
}
