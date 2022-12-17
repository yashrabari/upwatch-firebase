import 'package:flutter/gestures.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';
import 'package:upwatch/common/all.dart';
import 'package:upwatch/screen/new_password_screen/new_password_screen.dart';
import 'package:upwatch/screen/verify_email_screen/verify_email_controller.dart';

import '../base_screen.dart';

class VerifyEmailScreen extends GetView<VerifyEmailController> {
  const VerifyEmailScreen({Key? key}) : super(key: key);
  static const routes = "/VerifyEmailScreen";

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
                        ImagePath.verifyEmail,
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
                        Strings.pleaseEnter("jhon@gmail.com"),
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
                    margin: EdgeInsets.only(top: 6.h, bottom: controller.appDimensions.btnTopMargin),
                    child: OtpTextField(
                      numberOfFields: 4,
                      showFieldAsBox: true,
                      borderWidth: 0,
                      borderRadius: BorderRadius.all(Radius.circular(8.px)),
                      fillColor: controller.appColors.appGray.withOpacity(0.5),
                      filled: true,
                      borderColor: controller.appColors.appGray.withOpacity(0.5),
                      focusedBorderColor: controller.appColors.appGray.withOpacity(0.5),
                      onCodeChanged: (String code) {
                        //handle validation or checks here
                      },
                      fieldWidth: 18.w,
                      //runs when every textfield is filled
                      onSubmit: (String verificationCode) {}, // end onSubmit
                    ),
                  ),
                  CommonButton(
                    onTap: () {
                      Get.toNamed(NewPasswordScreen.routes);
                    },
                    width: double.infinity,
                    height: controller.appDimensions.btnHeight,
                    textSize: controller.appDimensions.btnTextSize,
                    textWeight: FontWeight.bold,
                    title: Strings.verify.toUpperCase(),
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
                  textSize: 17.sp,
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
                        textSize: 17.sp,
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
