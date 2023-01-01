import 'package:flutter/gestures.dart';
import 'package:upwatch/common/all.dart';
import 'package:upwatch/screen/forgot_password_screen/forgot_password_controller.dart';
import 'package:upwatch/screen/verify_email_screen/verify_email_screen.dart';

import '../base_screen.dart';

class ForgotPasswordScreen extends GetView<ForgotPasswordController> {
  const ForgotPasswordScreen({Key? key}) : super(key: key);
  static const routes = "/ForgotScreen";

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
                          Strings.verifyYourEmail,
                          isMaxLineWrap: true,
                          textStyleNew: MyTextStyle(
                            textSize: 22.sp,
                            textColor: controller.appColors.appText,
                            textWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      MyTextView(
                        Strings.forgotPasswordDes,
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
                    margin: EdgeInsets.only(top: 4.h, bottom: controller.appDimensions.btnTopMargin),
                    child: CommonTextFieldWithTitle(
                      titleText: Strings.email,
                      hintText: Strings.hintEmail,
                      inputType: TextInputType.emailAddress,
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
                    ),
                  ),
                  CommonButton(
                    onTap: () {
                      Get.toNamed(VerifyEmailScreen.routes);
                    },
                    width: double.infinity,
                    height: controller.appDimensions.btnHeight,
                    textSize: controller.appDimensions.btnTextSize,
                    textWeight: FontWeight.bold,
                    title: Strings.send.toUpperCase(),
                  ),
                ],
              ),
            ),
          ),
          SizedBox(
            height: 2.h,
          ),
          Container(
            width: double.infinity,
            alignment: Alignment.center,
            child: RichText(
              text: TextSpan(
                text: Strings.rememberYourPassword,
                style: MyTextStyle(
                  textSize: 16.sp,
                  textColor: controller.appColors.appText,
                  textWeight: FontWeight.w500,
                ),
                children: <TextSpan>[
                  const TextSpan(text: ' '),
                  TextSpan(
                      text: Strings.login,
                      recognizer: TapGestureRecognizer()
                        ..onTap = () {
                          Get.back();
                        },
                      style: MyTextStyle(
                        textSize: 16.sp,
                        textColor: controller.appColors.red,
                        textWeight: FontWeight.w600,
                      )),
                ],
              ),
            ),
          ),
          SizedBox(
            height: 2.h,
          )
        ],
      ),
    );
  }
}
