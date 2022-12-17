import 'package:upwatch/Widget/custom_appbar.dart';
import 'package:upwatch/common/all.dart';
import 'package:upwatch/common/constants.dart';
import 'package:upwatch/screen/smartwatch_screen/smartwatch_controller.dart';

class ConnectionScreen extends GetView<ConnectionController> {
  static const routes = "/ConnectionScreen";
  @override
  Widget build(BuildContext context) {
    Get.put(ConnectionController());
    return Scaffold(
      appBar: CustomAppBar(
        isLeading: true,
      ),
      body: ListView(
        physics: BouncingScrollPhysics(),
        padding: EdgeInsets.symmetric(
          horizontal: AppDimensions().horizontalWholeApp,
        ),
        children: [
          SizedBox(height: 2.h),
          MyTextView(
            controller.screenFlag == 1 ? Strings.smartwatchConnection : Strings.healthAppConnection,
            textStyleNew: MyTextStyle(
              textFamily: AppFontFamily.GothamRoundedMedium,
              textSize: 25.px,
              textColor: controller.appColors.appText,
              textWeight: FontWeight.w500,
            ),
          ),
          SizedBox(height: 15.h),
          Image.asset(
            controller.screenFlag == 1 ? ImagePath.smartWatch : ImagePath.appConnection,
            height: 200.px,
          ),
          SizedBox(height: 40.px),
          MyTextView(
            controller.screenFlag == 1 ? Strings.goodEvening : Strings.connectHealthApp,
            textAlignNew: TextAlign.center,
            textStyleNew: MyTextStyle(
              textFamily: AppFontFamily.GothamRoundedMedium,
              textSize: 25.px,
              textColor: controller.appColors.appText,
              textWeight: FontWeight.w500,
            ),
          ),
          SizedBox(height: 15.px),
          MyTextView(
            controller.screenFlag == 1
                ? """If you have an Smart Watch, you
can pair it with your phone here."""
                : """Lorem Ipsum is simply dummy text of the printing and typesetting industry.""",
            textAlignNew: TextAlign.center,
            maxLinesNew: 2,
            textStyleNew: MyTextStyle(
              textFamily: AppFontFamily.GothamRounded,
              textSize: 16.sp,
              textColor: controller.appColors.textColors,
              textWeight: FontWeight.w500,
            ),
          ),
          SizedBox(height: 40.px),
          CommonButton(
            onTap: () {},
            width: double.infinity,
            height: AppDimensions().btnHeight,
            textSize: AppDimensions().btnTextSize,
            textWeight: FontWeight.bold,
            title: Strings.startPairing.toUpperCase(),
          ),
          SizedBox(height: 2.h),
        ],
      ),
    );
  }
}
