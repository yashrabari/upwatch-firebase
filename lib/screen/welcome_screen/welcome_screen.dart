import 'package:upwatch/common/all.dart';

import '../base_screen.dart';
import '../medical_screen/medical_screen.dart';
import 'welcome_controller.dart';

class WelcomeScreen extends GetView<WelcomeController> {
  const WelcomeScreen({Key? key}) : super(key: key);
  static const routes = "/WelcomeScreen";

  @override
  Widget build(BuildContext context) {
    return GetBuilder<WelcomeController>(builder: (logic) {
      return BaseScreen(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 4.h,
            ),
            Expanded(
              child: SizedBox(
                width: double.infinity,
                child: ListView(
                  physics: BouncingScrollPhysics(),
                  padding: EdgeInsets.only(top: 12.h),
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset(
                          ImagePath.welcome,
                          height: controller.appDimensions.welcomeImageSize,
                          width: controller.appDimensions.welcomeImageSize,
                        ),
                      ],
                    ),
                    Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Container(
                          margin: EdgeInsets.only(bottom: 2.h, top: 6.h),
                          child: MyTextView(
                            Strings.welcomeToUpWatch,
                            isMaxLineWrap: true,
                            textStyleNew: MyTextStyle(
                              textSize: 22.sp,
                              textColor: controller.appColors.appText,
                              textWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        MyTextView(
                          Strings.thankYouForJoining,
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
                      margin: EdgeInsets.only(
                          bottom: controller.appDimensions.btnTopMargin),
                    ),
                    CommonButton(
                      onTap: () {
                        Get.toNamed(MedicalScreen.routes);
                      },
                      width: double.infinity,
                      height: controller.appDimensions.btnHeight,
                      textSize: controller.appDimensions.btnTextSize,
                      textWeight: FontWeight.bold,
                      title: Strings.continueLabel.toUpperCase(),
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
