import 'package:upwatch/common/constants.dart';
import 'package:upwatch/screen/base_screen.dart';
import 'package:upwatch/screen/my_profile/edit_profile_screen/change_password_screen/change_password_screen.dart';
import 'package:upwatch/screen/my_profile/edit_profile_screen/edit_profile_controller.dart';

import '../../../common/all.dart';
import '../../../common/gradiant_app_text.dart';

class EditProfileScreen extends GetView<EditProfileController> {
  const EditProfileScreen({Key? key}) : super(key: key);
  static const routes = "/EditProfileScreen";

  @override
  Widget build(BuildContext context) {
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
              title: Strings.editProfile,
            ),
          ),
          Expanded(
            child: ListView(
              padding: EdgeInsets.zero,
              physics: BouncingScrollPhysics(),
              children: [
                CommonTextFieldWithTitle(
                  titleText: Strings.name,
                  titleStyle: MyTextStyle(
                    textSize: 16.px,
                    textColor: controller.appColors.appText,
                    textFamily: AppFontFamily.GothamRounded,
                    textWeight: FontWeight.w600,
                  ),
                  hintText: Strings.hintName,
                  hintTextStyle: MyTextStyle(
                    textSize: 16.px,
                    textColor: controller.appColors.appText.withOpacity(0.4),
                    textFamily: AppFontFamily.GothamRounded,
                    textWeight: FontWeight.w500,
                  ),
                  textFieldStyle: MyTextStyle(
                    textSize: 16.px,
                    textColor: controller.appColors.appText,
                    textFamily: AppFontFamily.GothamRounded,
                    textWeight: FontWeight.w500,
                  ),
                  controller: TextEditingController(),
                ),
                CommonTextFieldWithTitle(
                  titleText: Strings.email,
                  titleStyle: MyTextStyle(
                    textSize: 16.px,
                    textColor: controller.appColors.appText,
                    textFamily: AppFontFamily.GothamRounded,
                    textWeight: FontWeight.w600,
                  ),
                  hintText: Strings.hintEmail,
                  hintTextStyle: MyTextStyle(
                    textSize: 16.px,
                    textColor: controller.appColors.appText.withOpacity(0.4),
                    textFamily: AppFontFamily.GothamRounded,
                    textWeight: FontWeight.w500,
                  ),
                  textFieldStyle: MyTextStyle(
                    textSize: 16.px,
                    textColor: controller.appColors.appText,
                    textFamily: AppFontFamily.GothamRounded,
                    textWeight: FontWeight.w500,
                  ),
                  controller: TextEditingController(),
                ),
                Obx(() {
                  return Container(
                    margin: EdgeInsets.only(top: controller.appDimensions.topSpaceTextField),
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
                  margin: EdgeInsets.only(top: controller.appDimensions.topSpaceTextField),
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
                              textSize: 16.px,
                              textColor: controller.appColors.appText,
                              textWeight: FontWeight.bold,
                            )),
                      ),
                      SizedBox(height: 5.px),
                      Obx(() {
                        return GestureDetector(
                          onTap: () async {
                            DateTime? datePick = await controller.utils.selectDate(context);
                            printWhite("--> --> --> ${datePick}");
                            List dateList = datePick.toString().split(" ");
                            controller.date!.value = dateList[0].toString().split("-");
                            printWhite("--> --> --> ${controller.date}");
                          },
                          child: Row(
                            children: [
                              Expanded(
                                child: Container(
                                  height: 55.px,
                                  decoration: BoxDecoration(
                                    color: controller.appColors.borderColor.withOpacity(0.3),
                                    borderRadius: BorderRadius.circular(8.0.px),
                                    border: Border.all(color: controller.appColors.borderColor.withOpacity(0.3)),
                                  ),
                                  alignment: Alignment.center,
                                  child: Padding(
                                    padding: EdgeInsets.symmetric(horizontal: 1.h, vertical: 1.7.h),
                                    child: CommonMediumText(
                                        title: controller.date!.isEmpty ? Strings.month : controller.date![1],
                                        textStyle: MyTextStyle(
                                          textSize: 16.px,
                                          textColor: controller.appColors.appText,
                                          textWeight: FontWeight.normal,
                                        )),
                                  ),
                                ),
                              ),
                              Expanded(
                                child: Container(
                                  height: 55.px,
                                  margin: EdgeInsets.symmetric(horizontal: 2.w),
                                  padding: EdgeInsets.symmetric(horizontal: 1.h, vertical: 1.7.h),
                                  decoration: BoxDecoration(
                                    color: controller.appColors.borderColor.withOpacity(0.3),
                                    borderRadius: BorderRadius.circular(8.0.px),
                                    border: Border.all(color: controller.appColors.borderColor.withOpacity(0.3)),
                                  ),
                                  alignment: Alignment.center,
                                  child: CommonMediumText(
                                      title: controller.date!.isEmpty ? Strings.day : controller.date![2],
                                      textStyle: MyTextStyle(
                                        textSize: 16.px,
                                        textColor: controller.appColors.appText,
                                        textWeight: FontWeight.normal,
                                      )),
                                ),
                              ),
                              Expanded(
                                child: Container(
                                  height: 55.px,
                                  padding: EdgeInsets.symmetric(horizontal: 1.h, vertical: 1.7.h),
                                  decoration: BoxDecoration(
                                    color: controller.appColors.borderColor.withOpacity(0.3),
                                    borderRadius: BorderRadius.circular(8.0.px),
                                    border: Border.all(color: controller.appColors.borderColor.withOpacity(0.3)),
                                  ),
                                  alignment: Alignment.center,
                                  child: CommonMediumText(
                                      title: controller.date!.isEmpty ? Strings.year : controller.date![0],
                                      textStyle: MyTextStyle(
                                        textSize: 16.px,
                                        textColor: controller.appColors.appText,
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
                SizedBox(height: 35.px),
                Align(
                  alignment: Alignment.center,
                  child: GestureDetector(
                    onTap: () {
                      Get.toNamed(ChangePasswordScreen.routes);
                    },
                    child: GradientText(
                      Strings.changePassword,
                      gradient: LinearGradient(
                        colors: AppColors.gradiantColor,
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                      ),
                      style: MyTextStyle(
                        textSize: 18.px,
                        textWeight: FontWeight.w600,
                        textHeight: 2.px,
                        textDecorations: TextDecoration.underline,
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 35.px),
                CommonButton(
                  onTap: () {
                    Get.back();
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
        ],
      ),
    );
  }
}
