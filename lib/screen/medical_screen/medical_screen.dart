import 'package:upwatch/common/all.dart';

import '../base_screen.dart';
import '../measurement_selection_screen/measurement_selection_screen.dart';
import '../selection_screen/selection_screen.dart';
import 'medical_controller.dart';

class MedicalScreen extends GetView<MedicalController> {
  const MedicalScreen({Key? key}) : super(key: key);
  static const routes = "/MedicalScreen";

  @override
  Widget build(BuildContext context) {
    return GetBuilder<MedicalController>(builder: (logic) {
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
                          controller.identify.isNotEmpty ? ImagePath.bodyMeasurement : ImagePath.medical,
                          width: controller.appDimensions.welcomeImageSize,
                          height: controller.appDimensions.welcomeImageSize,
                        ),
                      ],
                    ),
                    Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Container(
                          margin: EdgeInsets.only(bottom: 2.h, top: 6.h),
                          child: MyTextView(
                            controller.identify.isNotEmpty ? Strings.bodyMeasurement : Strings.medicalHistory,
                            isMaxLineWrap: true,
                            textStyleNew: MyTextStyle(
                              textSize: 22.sp,
                              textColor: controller.appColors.appText,
                              textWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        MyTextView(
                          Strings.loremText,
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
                      margin: EdgeInsets.only(bottom: controller.appDimensions.btnTopMargin),
                    ),
                    CommonButton(
                      onTap: () {
                        if (controller.identify.isNotEmpty) {
                          Get.toNamed(MeasurementSelectionScreen.routes);
                        } else {
                          Get.toNamed(SelectionScreen.routes);
                        }
                      },
                      width: double.infinity,
                      height: controller.appDimensions.btnHeight,
                      textSize: controller.appDimensions.btnTextSize,
                      textWeight: FontWeight.bold,
                      title: Strings.go.toUpperCase(),
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
