import 'package:upwatch/screen/login_screen/login_screen.dart';

import '../../common/all.dart';
import '../base_screen.dart';
import 'delete_confirm_controller.dart';

class DeleteConfirmScreen extends GetView<DeleteConfirmController> {
  const DeleteConfirmScreen({Key? key}) : super(key: key);
  static const routes = "/DeleteConfirmScreen";

  @override
  Widget build(BuildContext context) {
    return GetBuilder<DeleteConfirmController>(
      builder: (_) {
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
                  title: Strings.deleteAccount,
                ),
              ),
              SizedBox(
                height: 2.h,
              ),
              Expanded(
                child: ListView(
                  padding: EdgeInsets.zero,
                  children: [
                    CommonTextFieldWithTitle(
                      titleText: Strings.typeWhyYouLeave,
                      hintText: "",
                      textInputAction: TextInputAction.next,
                      inputType: TextInputType.emailAddress,
                      titleStyle: MyTextStyle(
                        textSize: controller.appDimensions.textFieldTitleText,
                        textColor: controller.appColors.appText,
                        textWeight: FontWeight.bold,
                      ),
                      hintTextStyle: MyTextStyle(
                        textSize: controller.appDimensions.textFieldHintText,
                        textColor: controller.appColors.buttonBackGroundColor,
                        textWeight: FontWeight.w400,
                      ),
                      textFieldStyle: MyTextStyle(
                        textSize: controller.appDimensions.textFieldText,
                        textColor: controller.appColors.buttonBackGroundColor,
                        textWeight: FontWeight.w400,
                      ),
                      controller: controller.controllerReason,
                      // isHeight: true,
                    ),
                    Container(
                      margin: EdgeInsets.only(top: controller.appDimensions.topSpaceTextField),
                      child: CommonTextFieldWithTitle(
                        titleText: Strings.typeDelete,
                        hintText: Strings.delete,
                        obscureText: false,
                        textInputAction: TextInputAction.done,
                        titleStyle: MyTextStyle(
                          textSize: controller.appDimensions.textFieldTitleText,
                          textColor: controller.appColors.appText,
                          textWeight: FontWeight.bold,
                        ),
                        hintTextStyle: MyTextStyle(
                          textSize: controller.appDimensions.textFieldHintText,
                          textColor: controller.appColors.buttonBackGroundColor,
                          textWeight: FontWeight.w400,
                        ),
                        textFieldStyle: MyTextStyle(
                          textSize: controller.appDimensions.textFieldText,
                          textColor: controller.appColors.buttonBackGroundColor,
                          textWeight: FontWeight.w400,
                        ),
                        controller: controller.controllerDelete,
                        // isHeight: true,
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(top: 40.px),
                      child: CommonButton(
                        onTap: () {
                          Get.offAllNamed(LoginScreen.routes);
                        },
                        width: double.infinity,
                        height: controller.appDimensions.btnHeight,
                        textSize: controller.appDimensions.btnTextSize,
                        textWeight: FontWeight.bold,
                        title: Strings.confirm.toUpperCase(),
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        );
      },
    );
  }
}
