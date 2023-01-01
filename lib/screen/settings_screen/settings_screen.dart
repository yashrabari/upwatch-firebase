import 'package:upwatch/Widget/custom_appbar.dart';
import 'package:upwatch/common/rx_common_model.dart';
import 'package:upwatch/screen/dashboard_screen/dashboard_screen.dart';
import 'package:upwatch/screen/health_record_screen/health_record_screen.dart';
import 'package:upwatch/screen/help_screen/help_screen.dart';
import 'package:upwatch/screen/language_change_screen/language_change_screen.dart';
import 'package:upwatch/screen/login_screen/login_screen.dart';
import 'package:upwatch/screen/my_profile/profile_screen/profile_screen.dart';
import 'package:upwatch/screen/smartwatch_screen/smartwatch_binding.dart';
import 'package:upwatch/screen/smartwatch_screen/smartwatch_screen.dart';

import '../../common/all.dart';
import '../delete_account_screen/delete_account_screen.dart';
import 'settings_controller.dart';

class SettingsScreen extends GetView<SettingsController> {
  const SettingsScreen({Key? key}) : super(key: key);
  static const routes = "/SettingsScreen";

  @override
  Widget build(BuildContext context) {
    AppColors appColors = AppColors();
    return GetBuilder<SettingsController>(
      builder: (_) {
        return Scaffold(
          appBar: CustomAppBar(
            title: Strings.setting,
          ),
          body: Column(
            children: [
              Expanded(
                child: ListView.builder(
                  shrinkWrap: true,
                  padding: EdgeInsets.symmetric(horizontal: AppDimensions().horizontalWholeApp),
                  physics: BouncingScrollPhysics(),
                  itemBuilder: (mContext, index) {
                    RxCommonModel model = controller.listSettings[index];
                    return GestureDetector(
                      onTap: () {
                        if (model.title == Strings.myProfile) {
                          Get.toNamed(ProfileScreen.routes);
                        } else if (model.title == Strings.healthDataRecordSetting) {
                          Get.to(HealthRecordScreen());
                        } else if (model.title == Strings.dashboardSetting) {
                          Get.to(DashboardSettingScreen());
                        } else if (model.title == Strings.smartwatchConnection) {
                          Get.to(ConnectionScreen(), arguments: 1, binding: ConnectionBinding());
                        } else if (model.title == Strings.healthAppConnection) {
                          Get.to(ConnectionScreen(), arguments: 0, binding: ConnectionBinding());
                        } else if (model.title == Strings.getHelp) {
                          Get.toNamed(HelpScreen.routes);
                        } else if (model.title == Strings.language) {
                          Get.toNamed(LanguageChangeScreen.routes, arguments: ['fromSettings']);
                        } else if (model.title == Strings.deleteAccount) {
                          Get.toNamed(DeleteAccountScreen.routes);
                        } else if (model.title == Strings.logout) {
                          Get.offAllNamed(LoginScreen.routes);
                        }
                      },
                      child: Container(
                        height: 55.px,
                        margin: EdgeInsets.only(bottom: 20.px),
                        padding: EdgeInsets.symmetric(horizontal: 15.px),
                        decoration: BoxDecoration(
                          color: model.title == Strings.logout ? appColors.borderColor.withOpacity(0.1) : appColors.borderColor.withOpacity(0.3),
                          borderRadius: BorderRadius.circular(10.0.px),
                          border: Border.all(
                            color: model.title == Strings.logout ? appColors.budgeColor.withOpacity(0.5) : appColors.borderColor.withOpacity(0.3),
                          ),
                        ),
                        child: Row(
                          children: [
                            Expanded(
                              child: MyTextView(
                                model.title,
                                isMaxLineWrap: true,
                                textAlignNew: TextAlign.start,
                                textStyleNew: MyTextStyle(
                                  textSize: 16.sp,
                                  textColor: appColors.appText,
                                  textWeight: FontWeight.w600,
                                ),
                              ),
                            ),
                            SizedBox(
                              width: 4.5.w,
                              height: 4.5.w,
                              child: Padding(
                                padding: EdgeInsets.all(2.px),
                                child: Image.asset(
                                  ImagePath.nextArrowHelp,
                                  color: (model.title == Strings.logout ? appColors.budgeColor : appColors.appText),
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                    );
                  },
                  itemCount: controller.listSettings.length,
                ),
              ),
              SizedBox(height: 10.h),
            ],
          ),
        );
      },
    );
  }
}
