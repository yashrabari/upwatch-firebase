import '../../common/all.dart';
import '../base_screen.dart';
import 'contact_us_controller.dart';

class ContactUsScreen extends GetView<ContactUsController> {
  const ContactUsScreen({Key? key}) : super(key: key);
  static const routes = "/ContactUsScreen";

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ContactUsController>(
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
                  isBack: true,
                  isTitle: true,
                  title: Strings.contactUs,
                ),
              ),
              Expanded(
                child: ListView(
                  shrinkWrap: true,
                  padding: EdgeInsets.zero,
                  physics: BouncingScrollPhysics(),
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        CommonTextFieldWithTitle(
                          titleText: Strings.name,
                          hintText: Strings.hintName,
                          textInputAction: TextInputAction.next,
                          inputType: TextInputType.text,
                          titleStyle: MyTextStyle(
                            textSize: 17.sp,
                            textColor: controller.appColors.appText,
                            textWeight: FontWeight.bold,
                          ),
                          hintTextStyle: MyTextStyle(
                            textSize: 17.sp,
                            textColor: controller.appColors.buttonBackGroundColor,
                            textWeight: FontWeight.w400,
                          ),
                          textFieldStyle: MyTextStyle(
                            textSize: 17.sp,
                            textColor: controller.appColors.buttonBackGroundColor,
                            textWeight: FontWeight.w400,
                          ),
                          controller: TextEditingController(),
                          // isHeight: true,
                        ),
                        Container(
                          margin: EdgeInsets.only(top: controller.appDimensions.topSpaceTextField),
                          child: CommonTextFieldWithTitle(
                            titleText: Strings.email,
                            hintText: Strings.hintEmail,
                            inputType: TextInputType.emailAddress,
                            textInputAction: TextInputAction.next,
                            titleStyle: MyTextStyle(
                              textSize: 17.sp,
                              textColor: controller.appColors.appText,
                              textWeight: FontWeight.bold,
                            ),
                            hintTextStyle: MyTextStyle(
                              textSize: 17.sp,
                              textColor: controller.appColors.buttonBackGroundColor,
                              textWeight: FontWeight.w400,
                            ),
                            textFieldStyle: MyTextStyle(
                              textSize: 17.sp,
                              textColor: controller.appColors.buttonBackGroundColor,
                              textWeight: FontWeight.w400,
                            ),
                            controller: TextEditingController(),
                            // isHeight: true,
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(top: controller.appDimensions.topSpaceTextField),
                          child: CommonTextFieldWithTitle(
                            titleText: Strings.subject,
                            hintText: Strings.hintSubject,
                            textInputAction: TextInputAction.next,
                            titleStyle: MyTextStyle(
                              textSize: 17.sp,
                              textColor: controller.appColors.appText,
                              textWeight: FontWeight.bold,
                            ),
                            hintTextStyle: MyTextStyle(
                              textSize: 17.sp,
                              textColor: controller.appColors.buttonBackGroundColor,
                              textWeight: FontWeight.w400,
                            ),
                            textFieldStyle: MyTextStyle(
                              textSize: 17.sp,
                              textColor: controller.appColors.buttonBackGroundColor,
                              textWeight: FontWeight.w400,
                            ),
                            controller: TextEditingController(),
                            // isHeight: true,
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(top: controller.appDimensions.topSpaceTextField),
                          child: CommonTextFieldWithTitle(
                            titleText: Strings.message,
                            hintText: Strings.message,
                            inputType: TextInputType.multiline,
                            textInputAction: TextInputAction.newline,
                            maxLine: 4,
                            minLines: 4,
                            titleStyle: MyTextStyle(
                              textSize: 17.sp,
                              textColor: controller.appColors.appText,
                              textWeight: FontWeight.bold,
                            ),
                            hintTextStyle: MyTextStyle(
                              textSize: 17.sp,
                              textColor: controller.appColors.buttonBackGroundColor,
                              textWeight: FontWeight.w400,
                            ),
                            textFieldStyle: MyTextStyle(
                              textSize: 17.sp,
                              textColor: controller.appColors.buttonBackGroundColor,
                              textWeight: FontWeight.w400,
                            ),
                            controller: TextEditingController(),
                            isHeight: false,
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(top: 4.h),
                          child: CommonButton(
                            onTap: () {
                              Get.back();
                            },
                            width: double.infinity,
                            height: controller.appDimensions.btnHeight,
                            textSize: controller.appDimensions.btnTextSize,
                            textWeight: FontWeight.bold,
                            title: Strings.submit.toUpperCase(),
                          ),
                        ),
                      ],
                    ),
                  ],
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
