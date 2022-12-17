import 'package:upwatch/screen/base_screen.dart';
import 'package:upwatch/screen/home_screen/notifications_screen/notifications_controller.dart';

import '../../../common/all.dart';

class NotificationsScreen extends GetView<NotificationsController> {
  const NotificationsScreen({Key? key}) : super(key: key);
  static const routes = "/NotificationsScreen";

  @override
  Widget build(BuildContext context) {
    return BaseScreen(
      child: Column(
        children: [
          Padding(
            padding: EdgeInsets.only(top: 3.5.h),
            child: CommonBackArrow(
              backArrowTap: () {
                Get.back();
              },
              isBack: true,
              isTitle: true,
              title: Strings.notifications,
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: 3,
              physics: BouncingScrollPhysics(),
              padding: EdgeInsets.zero,
              itemBuilder: (context, index) {
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Visibility(
                      visible: index == 0 || index == 2,
                      child: Column(
                        children: [
                          index == 2 ? SizedBox(height: 30.px) : SizedBox(),
                          MyTextView(
                            "Today 08 Sep 2022",
                            textStyleNew: MyTextStyle(
                              textSize: 16.px,
                              textWeight: FontWeight.w600,
                              textColor: controller.appColors.appText,
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 15.px),
                    CommonContainer(
                      isBorderRadius: true,
                      isHeight: false,
                      color: controller.appColors.borderColor.withOpacity(0.3),
                      padding: EdgeInsets.all(20.px),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          CommonContainer(
                            isWidth: true,
                            height: 41.px,
                            width: 41.px,
                            isBorderRadius: true,
                            gradient: LinearGradient(
                              begin: Alignment.topCenter,
                              end: Alignment.bottomCenter,
                              colors: [
                                controller.appColors.appOrange2,
                                controller.appColors.appOrange1,
                              ],
                            ),
                            child: Padding(
                              padding: EdgeInsets.all(8.px),
                              child: Image.asset(ImagePath.appSplashLogo),
                            ),
                          ),
                          SizedBox(width: 15.px),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              MyTextView(
                                "Lorem Ipsum",
                                textStyleNew: MyTextStyle(
                                  textSize: 16.px,
                                  textWeight: FontWeight.w600,
                                  textColor: controller.appColors.appText,
                                ),
                              ),
                              SizedBox(height: 1.px),
                              MyTextView(
                                "Lorem Ipsum is simply dummy\ntext of the printing and\ntypesetting industry.",
                                isMaxLineWrap: true,
                                textStyleNew: MyTextStyle(
                                  textSize: 14.px,
                                  textWeight: FontWeight.w500,
                                  textColor: controller.appColors.appText.withOpacity(0.60),
                                ),
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                  ],
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
