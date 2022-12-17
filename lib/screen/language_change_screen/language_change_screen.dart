import 'package:upwatch/common/all.dart';

import '../base_screen.dart';
import '../welcome_screen/welcome_screen.dart';
import 'language_change_controller.dart';

class LanguageChangeScreen extends GetView<LanguageChangeController> {
  const LanguageChangeScreen({Key? key}) : super(key: key);
  static const routes = "/LanguageChangeScreen";

  @override
  Widget build(BuildContext context) {
    return GetBuilder<LanguageChangeController>(builder: (logic) {
      return BaseScreen(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            controller.identify.isNotEmpty
                ? Padding(
                    padding: EdgeInsets.only(top: 3.5.h),
                    child: CommonBackArrow(
                      backArrowTap: () {
                        Get.back();
                      },
                      isBack: true,
                      isTitle: true,
                      title: Strings.language,
                    ),
                  )
                : SizedBox(
                    height: 4.h,
                  ),
            Expanded(
              child: SizedBox(
                width: double.infinity,
                child: ListView(
                  physics: BouncingScrollPhysics(),
                  padding: EdgeInsets.only(top: controller.identify.isNotEmpty ? 0 : 12.h),
                  children: [
                    controller.identify.isEmpty
                        ? Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Image.asset(
                                    ImagePath.languageChange,
                                    width: controller.appDimensions.forgotImageSize,
                                  ),
                                ],
                              ),
                              Container(
                                margin: EdgeInsets.only(bottom: 2.h, top: 6.h),
                                child: MyTextView(
                                  Strings.chooseTheLanguage,
                                  isMaxLineWrap: true,
                                  textStyleNew: MyTextStyle(
                                    textSize: 22.sp,
                                    textColor: controller.appColors.appText,
                                    textWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                              MyTextView(
                                Strings.selectYourLanguage,
                                isMaxLineWrap: true,
                                textAlignNew: TextAlign.center,
                                textStyleNew: MyTextStyle(
                                  textSize: 17.sp,
                                  textColor: controller.appColors.appText,
                                  textWeight: FontWeight.w100,
                                ),
                              ),
                            ],
                          )
                        : const SizedBox(),
                    Container(
                      margin: EdgeInsets.only(top: 4.h, bottom: controller.appDimensions.btnTopMargin),
                      child: Row(
                        children: [
                          Expanded(
                              child: ClipRRect(
                            borderRadius: BorderRadius.all(Radius.circular(8.px)),
                            child: GestureDetector(
                              onTap: () {
                                controller.isAgree.value = !controller.isAgree.value;
                                controller.update();
                              },
                              child: Container(
                                color: controller.appColors.appGray.withOpacity(0.5),
                                height: 25.h,
                                child: Stack(
                                  children: [
                                    Positioned(
                                      right: 8,
                                      top: 8,
                                      child: Image.asset(
                                        controller.isAgree.value ? ImagePath.check : ImagePath.unCheckRing,
                                        width: 7.w,
                                        height: 7.w,
                                      ),
                                    ),
                                    SizedBox(
                                      height: 25.h,
                                      child: Padding(
                                        padding: EdgeInsets.symmetric(horizontal: 20.px),
                                        child: Column(
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: [
                                            Expanded(
                                              flex: 2,
                                              child: Container(
                                                alignment: Alignment.bottomCenter,
                                                child: Row(
                                                  children: [
                                                    Image.asset(
                                                      ImagePath.flagChinese,
                                                      width: 18.w,
                                                      height: 18.w,
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ),
                                            Expanded(
                                              child: MyTextView(
                                                Strings.traditionalChinese,
                                                isMaxLineWrap: true,
                                                textStyleNew: MyTextStyle(
                                                  textSize: 16.sp,
                                                  textColor: controller.appColors.appText,
                                                  textWeight: FontWeight.bold,
                                                ),
                                              ),
                                            )
                                          ],
                                        ),
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            ),
                          )),
                          SizedBox(
                            width: 4.w,
                          ),
                          Expanded(
                              child: ClipRRect(
                            borderRadius: BorderRadius.all(Radius.circular(8.px)),
                            child: GestureDetector(
                              onTap: () {
                                controller.isAgree.value = !controller.isAgree.value;
                                controller.update();
                              },
                              child: Container(
                                color: controller.appColors.appGray.withOpacity(0.5),
                                height: 25.h,
                                child: Stack(
                                  children: [
                                    Positioned(
                                      right: 8,
                                      top: 8,
                                      child: Image.asset(
                                        controller.isAgree.value ? ImagePath.unCheckRing : ImagePath.check,
                                        width: 7.w,
                                        height: 7.w,
                                      ),
                                    ),
                                    SizedBox(
                                      height: 25.h,
                                      child: Padding(
                                        padding: EdgeInsets.symmetric(horizontal: 20.px),
                                        child: Column(
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: [
                                            Expanded(
                                              flex: 2,
                                              child: Container(
                                                alignment: Alignment.bottomCenter,
                                                child: Row(
                                                  children: [
                                                    Image.asset(
                                                      ImagePath.flagUS,
                                                      width: 18.w,
                                                      height: 18.w,
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ),
                                            Expanded(
                                              child: MyTextView(
                                                Strings.english,
                                                isMaxLineWrap: true,
                                                textStyleNew: MyTextStyle(
                                                  textSize: 16.sp,
                                                  textColor: controller.appColors.appText,
                                                  textWeight: FontWeight.bold,
                                                ),
                                              ),
                                            )
                                          ],
                                        ),
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            ),
                          ))
                        ],
                      ),
                    ),
                    CommonButton(
                      onTap: () {
                        if (controller.identify.isNotEmpty) {
                          Get.back();
                        } else {
                          Get.toNamed(WelcomeScreen.routes);
                        }
                      },
                      width: double.infinity,
                      height: controller.appDimensions.btnHeight,
                      textSize: controller.appDimensions.btnTextSize,
                      textWeight: FontWeight.bold,
                      title: controller.identify.isNotEmpty ? Strings.save.toUpperCase() : Strings.select.toUpperCase(),
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
    });
  }
}
