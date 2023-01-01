import 'package:flutter/gestures.dart';
import 'package:upwatch/screen/language_change_screen/language_change_screen.dart';
import 'package:upwatch/screen/signup_screen/signup_controller.dart';

import '../../common/all.dart';
import '../base_screen.dart';

class SignupScreen extends GetView<SignupController> {
  const SignupScreen({Key? key}) : super(key: key);
  static const routes = "/SignupScreen";

  @override
  Widget build(BuildContext context) {
    return GetBuilder<SignupController>(
      init: SignupController(),
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
                  isBack: false,
                  isTitle: true,
                  centerTitle: true,
                  title: Strings.letsGetStarted,
                ),
              ),
              Expanded(
                child: ListView(
                  shrinkWrap: true,
                  physics: BouncingScrollPhysics(),
                  padding: EdgeInsets.zero,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        MyTextView(
                          Strings.createAnAccount,
                          isMaxLineWrap: true,
                          textAlignNew: TextAlign.center,
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
                        ///  Name -->
                        CommonTextFieldWithTitle(
                          titleText: Strings.name,
                          hintText: Strings.hintName,
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
                                .withOpacity(0.6),
                            textWeight: FontWeight.w400,
                          ),
                          textFieldStyle: MyTextStyle(
                            textSize: controller.appDimensions.textFieldText,
                            textColor:
                                controller.appColors.buttonBackGroundColor,
                            textWeight: FontWeight.w400,
                          ),
                          controller: controller.controllerName,
                          // isHeight: true,
                        ),

                        ///  Email -->
                        Container(
                          margin: EdgeInsets.only(
                              top: controller.appDimensions.topSpaceTextField),
                          child: CommonTextFieldWithTitle(
                            titleText: Strings.email,
                            hintText: Strings.hintEmail,
                            inputType: TextInputType.emailAddress,
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
                        ),

                        ///  Gender -->
                        Obx(() {
                          return Container(
                            margin: EdgeInsets.only(
                                top:
                                    controller.appDimensions.topSpaceTextField),
                            child: CommonDropdownWithTitle(
                              titleText: Strings.gender,
                              itemsList: const ["Select", "Female", "Male"],
                              dropdownValue: controller.dropdownValue.value,
                              onChanged: (val) {
                                controller.dropdownValue.value = val!;
                              },
                            ),
                          );
                        }),
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
                                    title: Strings.dob,
                                    textStyle: MyTextStyle(
                                      textSize: controller
                                          .appDimensions.textFieldTitleText,
                                      textColor: controller.appColors.appText,
                                      textWeight: FontWeight.bold,
                                    )),
                              ),

                              ///  Date Of Birth -->
                              Obx(() {
                                return GestureDetector(
                                  onTap: () async {
                                    DateTime? datePick = await controller.utils
                                        .selectDate(context);
                                    printWhite("--> --> --> ${datePick}");
                                    List dateList =
                                        datePick.toString().split(" ");
                                    controller.date!.value =
                                        dateList[0].toString().split("-");
                                    printWhite(
                                        "--> --> --> ${controller.date}");
                                  },
                                  child: Row(
                                    children: [
                                      Expanded(
                                        child: Container(
                                          height: 55.px,
                                          decoration: BoxDecoration(
                                            color: controller
                                                .appColors.borderColor
                                                .withOpacity(0.3),
                                            borderRadius:
                                                BorderRadius.circular(8.0.px),
                                            border: Border.all(
                                                color: controller
                                                    .appColors.borderColor
                                                    .withOpacity(0.3)),
                                          ),
                                          alignment: Alignment.center,
                                          child: Padding(
                                            padding: EdgeInsets.symmetric(
                                                horizontal: 1.h,
                                                vertical: 1.7.h),
                                            child: CommonMediumText(
                                                title: controller.date!.isEmpty
                                                    ? Strings.month
                                                    : controller.date![1],
                                                textStyle: MyTextStyle(
                                                  textSize: controller
                                                      .appDimensions
                                                      .textFieldText,
                                                  textColor: controller
                                                      .appColors.appText
                                                      .withOpacity(0.6),
                                                  textWeight: FontWeight.normal,
                                                )),
                                          ),
                                        ),
                                      ),
                                      Expanded(
                                        child: Container(
                                          height: 55.px,
                                          margin: EdgeInsets.symmetric(
                                              horizontal: 2.w),
                                          padding: EdgeInsets.symmetric(
                                              horizontal: 1.h, vertical: 1.7.h),
                                          decoration: BoxDecoration(
                                            color: controller
                                                .appColors.borderColor
                                                .withOpacity(0.3),
                                            borderRadius:
                                                BorderRadius.circular(8.0.px),
                                            border: Border.all(
                                                color: controller
                                                    .appColors.borderColor
                                                    .withOpacity(0.3)),
                                          ),
                                          alignment: Alignment.center,
                                          child: CommonMediumText(
                                              title: controller.date!.isEmpty
                                                  ? Strings.day
                                                  : controller.date![2],
                                              textStyle: MyTextStyle(
                                                textSize: controller
                                                    .appDimensions
                                                    .textFieldText,
                                                textColor: controller
                                                    .appColors.appText
                                                    .withOpacity(0.6),
                                                textWeight: FontWeight.normal,
                                              )),
                                        ),
                                      ),
                                      Expanded(
                                        child: Container(
                                          height: 55.px,
                                          padding: EdgeInsets.symmetric(
                                              horizontal: 1.h, vertical: 1.7.h),
                                          decoration: BoxDecoration(
                                            color: controller
                                                .appColors.borderColor
                                                .withOpacity(0.3),
                                            borderRadius:
                                                BorderRadius.circular(8.0.px),
                                            border: Border.all(
                                                color: controller
                                                    .appColors.borderColor
                                                    .withOpacity(0.3)),
                                          ),
                                          alignment: Alignment.center,
                                          child: CommonMediumText(
                                              title: controller.date!.isEmpty
                                                  ? Strings.year
                                                  : controller.date![0],
                                              textStyle: MyTextStyle(
                                                textSize: controller
                                                    .appDimensions
                                                    .textFieldText,
                                                textColor: controller
                                                    .appColors.appText
                                                    .withOpacity(0.6),
                                                textWeight: FontWeight.normal,
                                              )),
                                        ),
                                      )
                                    ],
                                  ),
                                );
                              })
                            ],
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(
                              top: controller.appDimensions.topSpaceTextField),
                          child: CommonTextFieldWithTitle(
                              titleText: Strings.password,
                              hintText: Strings.hintPassword,
                              obscureText: controller.isPHide.value,
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
                              rightImage: (controller.isPHide.value
                                  ? ImagePath.eyeCross
                                  : ImagePath.eyeShow),
                              rightImageTap: () {
                                controller.isPHide.value =
                                    !controller.isPHide.value;
                                controller.update();
                              }),
                        ),
                        Container(
                          margin: EdgeInsets.only(
                              top: controller.appDimensions.topSpaceTextField),
                          child: CommonTextFieldWithTitle(
                              titleText: Strings.confirmPassword,
                              hintText: Strings.hintConfirmPassword,
                              obscureText: controller.isCPHide.value,
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
                              controller: controller.controllerCPassword,
                              // isHeight: true,
                              isRightImage: true,
                              rightImage: (controller.isCPHide.value
                                  ? ImagePath.eyeCross
                                  : ImagePath.eyeShow),
                              rightImageTap: () {
                                controller.isCPHide.value =
                                    !controller.isCPHide.value;
                                controller.update();
                              }),
                        ),
                        Container(
                          margin: EdgeInsets.only(top: 2.h),
                          width: double.infinity,
                          alignment: Alignment.topLeft,
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              GestureDetector(
                                onTap: () {
                                  controller.isAgree.value =
                                      !controller.isAgree.value;
                                  controller.update();
                                },
                                child: Image.asset(
                                  controller.isAgree.value
                                      ? ImagePath.check
                                      : ImagePath.unCheck,
                                  width: 23.px,
                                  height: 23.px,
                                ),
                              ),
                              SizedBox(width: 2.w),
                              Expanded(
                                child: RichText(
                                  text: TextSpan(
                                    text: Strings.iAgreeToThe,
                                    style: MyTextStyle(
                                      textSize: 16.sp,
                                      textColor: controller.appColors.appText
                                          .withOpacity(0.5),
                                      textWeight: FontWeight.w500,
                                    ),
                                    children: <TextSpan>[
                                      const TextSpan(text: ' '),
                                      TextSpan(
                                        text: Strings.termsCondition,
                                        recognizer: TapGestureRecognizer()
                                          ..onTap = () {},
                                        style: MyTextStyle(
                                          textSize: 16.sp,
                                          textColor:
                                              controller.appColors.appText,
                                          textWeight: FontWeight.normal,
                                        ),
                                      ),
                                      TextSpan(
                                        text: Strings.and,
                                        recognizer: TapGestureRecognizer()
                                          ..onTap = () {},
                                        style: MyTextStyle(
                                          textSize: 16.sp,
                                          textColor: controller
                                              .appColors.appText
                                              .withOpacity(0.5),
                                          textWeight: FontWeight.normal,
                                        ),
                                      ),
                                      TextSpan(
                                          text: Strings.privacyPolicy,
                                          recognizer: TapGestureRecognizer()
                                            ..onTap = () {},
                                          style: MyTextStyle(
                                            textSize: 16.sp,
                                            textColor:
                                                controller.appColors.appText,
                                            textWeight: FontWeight.normal,
                                          )),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(top: 4.h),
                          child: CommonButton(
                            onTap: controller.signUpWithEmailAndPassword,
                            // onTap: () {
                            //   Get.toNamed(LanguageChangeScreen.routes);
                            // },
                            width: double.infinity,
                            height: controller.appDimensions.btnHeight,
                            textSize: controller.appDimensions.btnTextSize,
                            textWeight: FontWeight.bold,
                            title: Strings.signUp.toUpperCase(),
                          ),
                        ),
                      ],
                    ),
                  ],
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
                    text: Strings.alreadyAccount,
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
      },
    );
  }
}
