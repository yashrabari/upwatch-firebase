import 'package:upwatch/common/rx_common_model.dart';
import 'package:upwatch/screen/common_screen/common_screen.dart';
import 'package:upwatch/screen/contact_us_screen/contact_us_screen.dart';

import '../../common/all.dart';
import '../base_screen.dart';
import 'help_controller.dart';

class HelpScreen extends GetView<HelpController> {
  const HelpScreen({Key? key}) : super(key: key);
  static const routes = "/HelpScreen";

  @override
  Widget build(BuildContext context) {
    AppColors appColors = AppColors();
    return GetBuilder<HelpController>(
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
                  title: Strings.getHelp,
                ),
              ),
              Expanded(
                child: ListView.builder(
                  shrinkWrap: true,
                  physics: BouncingScrollPhysics(),
                  padding: EdgeInsets.zero,
                  itemBuilder: (mContext, index) {
                    RxCommonModel model = controller.listHelp[index];

                    return GestureDetector(
                      onTap: () {
                        if (model.title == Strings.aboutUs) {
                          Get.toNamed(CommonScreen.routes, arguments: [Strings.aboutUs]);
                        } else if (model.title == Strings.helpLegal) {
                          Get.toNamed(CommonScreen.routes, arguments: [Strings.helpLegal]);
                        } else if (model.title == Strings.privacyPolicyLabel) {
                          Get.toNamed(CommonScreen.routes, arguments: [Strings.privacyPolicyLabel]);
                        } else if (model.title == Strings.securityPolicy) {
                          Get.toNamed(CommonScreen.routes, arguments: [Strings.securityPolicy]);
                        } else if (model.title == Strings.termsCondition) {
                          Get.toNamed(CommonScreen.routes, arguments: [Strings.termsCondition]);
                        } else if (model.title == Strings.contactUs) {
                          Get.toNamed(ContactUsScreen.routes);
                        }
                      },
                      child: Container(
                        height: 55.px,
                        margin: EdgeInsets.only(top: 20.px),
                        padding: EdgeInsets.symmetric(horizontal: 20.px),
                        decoration: BoxDecoration(
                          color: appColors.borderColor.withOpacity(0.3),
                          borderRadius: BorderRadius.circular(8.0.px),
                          border: Border.all(
                            color: appColors.borderColor.withOpacity(0.3),
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
                            Image.asset(
                              ImagePath.nextArrowHelp,
                              width: 4.w,
                              height: 4.w,
                            )
                          ],
                        ),
                      ),
                    );
                  },
                  itemCount: controller.listHelp.length,
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
