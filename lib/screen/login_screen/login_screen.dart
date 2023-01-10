import 'package:flutter/gestures.dart';
import 'package:upwatch/screen/forgot_password_screen/forgot_password_screen.dart';
import 'package:upwatch/screen/login_screen/login_controller.dart';
import 'package:upwatch/screen/signup_screen/signup_screen.dart';
import 'package:upwatch/screen/tabbar_screen/tabbar_screen.dart';

import '../../common/all.dart';
import '../base_screen.dart';

class LoginScreen extends GetView<LoginController> {
  const LoginScreen({Key? key}) : super(key: key);
  static const routes = "/LoginScreen";

  @override
  Widget build(BuildContext context) {
    return GetBuilder<LoginController>(
      builder: (logic) {
        return BaseScreen(
          child: Column(
            children: [
              Expanded(
                child: ListView(
                  shrinkWrap: true,
                  physics: BouncingScrollPhysics(),
                  padding:
                      EdgeInsets.only(top: MediaQuery.of(context).padding.top),
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SizedBox(
                          height: 10.h,
                        ),
                        SizedBox(
                          child: Image.asset(
                            ImagePath.logoTextColor,
                            width: 40.w,
                          ),
                        ),
                        SizedBox(
                          height: 2.h,
                        ),
                        MyTextView(
                          Strings.helloThereLogin,
                          isMaxLineWrap: true,
                          textStyleNew: MyTextStyle(
                            textSize: 16.sp,
                            textColor: controller.appColors.appText,
                            textWeight: FontWeight.w300,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 2.h,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        CommonTextFieldWithTitle(
                          titleText: Strings.email,
                          hintText: Strings.hintEmail,
                          textInputAction: TextInputAction.next,
                          inputType: TextInputType.emailAddress,
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
                                .withOpacity(0.6),
                            textWeight: FontWeight.w400,
                          ),
                          textFieldStyle: MyTextStyle(
                            textSize: controller.appDimensions.textFieldText,
                            textColor:
                                controller.appColors.buttonBackGroundColor,
                            textWeight: FontWeight.w400,
                          ),
                          controller: controller.controllerEmail,
                          // isHeight: true,
                        ),
                        Container(
                          margin: EdgeInsets.only(
                              top: controller.appDimensions.topSpaceTextField),
                          child: CommonTextFieldWithTitle(
                              titleText: Strings.password,
                              hintText: Strings.hintPassword,
                              obscureText: controller.isHide.value,
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
                                    .withOpacity(0.6),
                                textWeight: FontWeight.w400,
                              ),
                              textFieldStyle: MyTextStyle(
                                textSize:
                                    controller.appDimensions.textFieldText,
                                textColor:
                                    controller.appColors.buttonBackGroundColor,
                                textWeight: FontWeight.w400,
                              ),
                              controller: controller.controllerPassword,
                              // isHeight: true,
                              isRightImage: true,
                              rightImage: (controller.isHide.value
                                  ? ImagePath.eyeCross
                                  : ImagePath.eyeShow),
                              rightImageTap: () {
                                controller.isHide.value =
                                    !controller.isHide.value;
                                controller.update();
                              }),
                        ),
                        GestureDetector(
                          onTap: () {
                            Get.toNamed(ForgotPasswordScreen.routes);
                          },
                          child: Container(
                            width: double.infinity,
                            alignment: Alignment.centerRight,
                            margin: EdgeInsets.symmetric(vertical: 2.h),
                            child: MyTextView(
                              Strings.forgotPassword,
                              isMaxLineWrap: true,
                              textStyleNew: MyTextStyle(
                                textSize: 16.sp,
                                textColor: controller.appColors.appText,
                                textWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(top: 2.h),
                          child: CommonButton(
                            onTap: controller.loginWithEmailAndPassword,
                            width: double.infinity,
                            height: controller.appDimensions.btnHeight,
                            textSize: controller.appDimensions.btnTextSize,
                            textWeight: FontWeight.bold,
                            title: Strings.login.toUpperCase(),
                          ),
                        ),
                        Container(
                          width: double.infinity,
                          alignment: Alignment.center,
                          margin: EdgeInsets.symmetric(vertical: 6.h),
                          child: Column(
                            children: [
                              MyTextView(
                                Strings.loginWithDifferentAccounts,
                                isMaxLineWrap: true,
                                textStyleNew: MyTextStyle(
                                  textSize: 16.sp,
                                  textColor: controller.appColors.appText,
                                  textWeight: FontWeight.bold,
                                ),
                              ),
                              Row(
                                children: [
                                  const Spacer(),
                                  SizedBox(
                                    height: 12.w,
                                    width: 12.w,
                                    child: InkWell(
                                      onTap: controller.signInWithFB,
                                      child: Container(
                                        decoration: BoxDecoration(
                                            border: Border.all(
                                              color: controller.appColors.btnFb,
                                            ),
                                            color: controller.appColors.btnFb
                                                .withOpacity(0.1),
                                            borderRadius: BorderRadius.all(
                                                Radius.circular(10.px))),
                                        // color: controller.appColors.btnFb.withOpacity(0.5),
                                        child: Padding(
                                          padding: EdgeInsets.all(2.5.w),
                                          child: SizedBox(
                                            child: Image.asset(
                                              ImagePath.logoFacebook,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                  InkWell(
                                    child: Container(
                                      height: 12.w,
                                      width: 12.w,
                                      margin: EdgeInsets.symmetric(
                                          horizontal: 2.w, vertical: 2.h),
                                      child: Container(
                                        decoration: BoxDecoration(
                                            border: Border.all(
                                              color: controller
                                                  .appColors.btnGoogle,
                                            ),
                                            color: controller
                                                .appColors.btnGoogle
                                                .withOpacity(0.1),
                                            borderRadius: BorderRadius.all(
                                                Radius.circular(10.px))),
                                        // color: controller.appColors.btnFb.withOpacity(0.5),
                                        child: Padding(
                                          padding: EdgeInsets.all(2.5.w),
                                          child: SizedBox(
                                            child: Image.asset(
                                              ImagePath.logoGoogle,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                    onTap: controller.signInWithGoogle,
                                  ),
                                  SizedBox(
                                    height: 12.w,
                                    width: 12.w,
                                    child: Container(
                                      decoration: BoxDecoration(
                                          border: Border.all(
                                            color: controller.appColors.black,
                                          ),
                                          color: controller.appColors.black
                                              .withOpacity(0.05),
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(10.px))),
                                      // color: controller.appColors.btnFb.withOpacity(0.5),
                                      child: Padding(
                                        padding: EdgeInsets.all(2.5.w),
                                        child: SizedBox(
                                          child: Image.asset(
                                            ImagePath.logoIos,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                  const Spacer()
                                ],
                              )
                            ],
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              Container(
                  width: double.infinity,
                  alignment: Alignment.center,
                  child: RichText(
                    text: TextSpan(
                      text: Strings.doNotAccount,
                      style: MyTextStyle(
                        textSize: 16.sp,
                        textColor: controller.appColors.appText,
                        textWeight: FontWeight.w500,
                      ),
                      children: <TextSpan>[
                        const TextSpan(text: ' '),
                        TextSpan(
                            text: Strings.signUp,
                            recognizer: TapGestureRecognizer()
                              ..onTap = () {
                                Get.toNamed(SignupScreen.routes);
                              },
                            style: MyTextStyle(
                              textSize: 16.sp,
                              textColor: controller.appColors.red,
                              textWeight: FontWeight.w600,
                            )),
                      ],
                    ),
                  )),
              SizedBox(
                height: 2.h,
              )
            ],
          ),
        );
      },
    );
  }
}
