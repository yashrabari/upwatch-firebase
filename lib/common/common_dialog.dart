import 'package:responsive_sizer/responsive_sizer.dart';

import '../../../common/all.dart';

void alertActionDialog({
  required BuildContext context,
  String? massage,
  String? rightBtnName,
  String? leftBtnName,
  GestureTapCallback? onRightClick,
  bool? barrierDismissible,
}) async {
  Utils utils = Utils();
  AppColors appColors = AppColors();
  utils.hideKeyboard();

  showDialog(
      context: context,
      barrierColor: Colors.black26,
      barrierDismissible: barrierDismissible ?? true,
      builder: (BuildContext context) {
        return StatefulBuilder(
          builder: (context, setState) {
            return Dialog(
              backgroundColor: Colors.transparent,
              insetPadding: EdgeInsets.symmetric(horizontal: 10.0.px),
              elevation: 8,
              child: Container(
                width: double.infinity,
                padding: EdgeInsets.all(10.0.px),
                decoration: BoxDecoration(
                  color: appColors.white,
                  borderRadius: BorderRadius.circular(10.0.px),
                  border: Border.all(width: 2, color: appColors.buttonBackGroundColor),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    MyTextView(
                      Strings.appName,
                      textStyleNew: MyTextStyle(
                        textColor: appColors.buttonBackGroundColor,
                        textSize: 16.dp,
                        textWeight: FontWeight.w400,
                      ),
                    ),
                    SizedBox(height: 2.0.h),
                    MyTextView(
                      massage ?? "",
                      isMaxLineWrap: true,
                      textAlignNew: TextAlign.center,
                      textStyleNew: MyTextStyle(
                        textColor: appColors.buttonBackGroundColor,
                        textSize: 14.dp,
                        textWeight: FontWeight.w500,
                      ),
                    ),
                    SizedBox(height: 2.0.h),
                    Row(
                      children: [
                        Expanded(
                          child: CommonButton(
                            title: leftBtnName ?? Strings.no,
                            isBorder: true,
                            textColor: appColors.buttonBackGroundColor,
                            buttonColor: appColors.white,
                            onTap: () {
                              Get.back();
                            },
                          ),
                        ),
                        SizedBox(width: 2.0.w),
                        Expanded(
                          child: CommonButton(
                            title: rightBtnName ?? Strings.yes,
                            onTap: onRightClick,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            );
          },
        );
      });
}

void messageDialog({
  required BuildContext context,
  String? massage,
  String? btnName,
  GestureTapCallback? onBtnClick,
  bool? barrierDismissible,
}) async {
  Utils utils = Utils();
  AppColors appColors = AppColors();
  utils.hideKeyboard();

  showDialog(
      context: context,
      barrierColor: Colors.black26,
      barrierDismissible: barrierDismissible ?? true,
      builder: (BuildContext context) {
        return StatefulBuilder(
          builder: (context, setState) {
            return Dialog(
              backgroundColor: Colors.transparent,
              insetPadding: EdgeInsets.symmetric(horizontal: 10.0.px),
              elevation: 8,
              child: Container(
                width: double.infinity,
                padding: EdgeInsets.all(10.0.px),
                decoration: BoxDecoration(
                  color: appColors.white,
                  borderRadius: BorderRadius.circular(10.0.px),
                  border: Border.all(width: 2.0, color: appColors.buttonBackGroundColor),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    MyTextView(
                      Strings.appName,
                      textStyleNew: MyTextStyle(
                        textColor: appColors.buttonBackGroundColor,
                        textSize: 16.dp,
                        textWeight: FontWeight.w400,
                      ),
                    ),
                    SizedBox(height: 2.0.h),
                    MyTextView(
                      massage ?? "",
                      isMaxLineWrap: true,
                      textAlignNew: TextAlign.center,
                      textStyleNew: MyTextStyle(
                        textColor: appColors.buttonBackGroundColor,
                        textSize: 14.dp,
                        textWeight: FontWeight.w500,
                      ),
                    ),
                    SizedBox(height: 2.h),
                    Row(
                      children: [
                        const Expanded(child: SizedBox()),
                        Expanded(
                          flex: 2,
                          child: CommonButton(
                            title: btnName ?? Strings.ok,
                            onTap: onBtnClick ?? () => Get.back(),
                          ),
                        ),
                        const Expanded(child: SizedBox()),
                      ],
                    ),
                  ],
                ),
              ),
            );
          },
        );
      });
}
