import 'package:upwatch/common/all.dart';
import 'package:upwatch/common/gradiant_app_text.dart';
import 'package:upwatch/common/rx_common_model.dart';
import 'package:upwatch/screen/home_screen/notifications_screen/notifications_screen.dart';

import '../Health_details_screen/health_details_screen.dart';
import '../daily_report_screen/daily_report_screen.dart';
import 'home_controller.dart';

class HomeScreen extends GetView<HomeController> {
  const HomeScreen({Key? key}) : super(key: key);
  static const routes = "/HomeScreen";

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.topCenter,
      children: [
        Container(
          height: 35.h,
          width: double.infinity,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage(ImagePath.homeTopBg),
              fit: BoxFit.cover,
            ),
          ),
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.px, vertical: 7.h),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                RichText(
                  text: TextSpan(
                    text: Strings.hello,
                    style: MyTextStyle(
                      textSize: 26.px,
                      textColor: controller.appColors.white,
                      textWeight: FontWeight.w400,
                    ),
                    children: [
                      TextSpan(
                        text: " Jon ",
                        style: MyTextStyle(
                          textWeight: FontWeight.bold,
                          textSize: 26.px,
                        ),
                      ),
                      TextSpan(
                        text: "👋\n",
                        style: MyTextStyle(
                          textWeight: FontWeight.bold,
                          textSize: 16.px,
                        ),
                      ),
                      TextSpan(
                        text: Strings.haveNiceDay,
                        style: MyTextStyle(
                          textSize: 16.px,
                          textColor: controller.appColors.white,
                          textWeight: FontWeight.w400,
                        ),
                      ),
                    ],
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    Get.toNamed(NotificationsScreen.routes);
                  },
                  child: Stack(
                    alignment: Alignment.topRight,
                    children: [
                      Container(
                        height: 50.px,
                        width: 50.px,
                        padding: EdgeInsets.all(2.px),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(10.px),
                          child: Image.asset(
                            ImagePath.dummyProfile,
                          ),
                        ),
                      ),
                      Container(
                        height: 11.px,
                        width: 11.px,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: controller.appColors.appOrange2 /*Color(0xfff94646)*/,
                          border: Border.all(color: controller.appColors.appText),
                        ),
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
        Padding(
          padding: EdgeInsets.only(top: 30.h),
          child: Container(
            height: 70.h,
            padding: EdgeInsets.all(20.px),
            decoration: BoxDecoration(
              color: controller.appColors.white,
              borderRadius: const BorderRadius.only(
                topRight: Radius.circular(20),
                topLeft: Radius.circular(20),
              ),
            ),
            child: ListView(
              shrinkWrap: true,
              physics: const BouncingScrollPhysics(),
              padding: EdgeInsets.only(top: 30.px),
              children: [
                GradientText(
                  Strings.weeklyAverage,
                  gradient: controller.utils.textGradiant,
                  style: MyTextStyle(
                    textSize: 18.px,
                    textWeight: FontWeight.w600,
                  ),
                ),
                ListView.separated(
                  itemCount: controller.homeList.length,
                  shrinkWrap: true,
                  padding: EdgeInsets.only(top: 10.px, bottom: AppBar().preferredSize.height + 25.px),
                  physics: const NeverScrollableScrollPhysics(),
                  itemBuilder: (context, index) {
                    RxCommonModel obj = controller.homeList[index];
                    return GestureDetector(
                      onTap: () {
                        Get.to(HealthDetailsScreen(), arguments: {
                          "title": controller.homeList[index].title,
                          "decimalType": controller.homeList[index].subTitle2,
                          "decimal": controller.homeList[index].subTitle,
                        });
                      },
                      child: CommonContainer(
                        isBorderRadius: true,
                        isHeight: false,
                        color: controller.appColors.borderColor.withOpacity(0.3),
                        padding: EdgeInsets.all(20.px),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                MyTextView(
                                  obj.title,
                                  textStyleNew: MyTextStyle(
                                    textColor: controller.appColors.appText,
                                    textSize: 16.px,
                                    textWeight: FontWeight.w600,
                                  ),
                                ),
                                SizedBox(height: 12.px),
                                Row(
                                  children: [
                                    GradientText(
                                      "${obj.subTitle} ",
                                      gradient: LinearGradient(
                                        colors: AppColors.gradiantColor,
                                        begin: Alignment.topCenter,
                                        end: Alignment.bottomCenter,
                                      ),
                                      style: MyTextStyle(
                                        textSize: 26.px,
                                        textWeight: FontWeight.w600,
                                      ),
                                    ),
                                    MyTextView(
                                      obj.subTitle2,
                                      textStyleNew: MyTextStyle(
                                        textSize: 14.px,
                                        textWeight: FontWeight.w600,
                                        textColor: controller.appColors.appText,
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                            Image.asset(
                              obj.image!,
                              height: 62.px,
                            )
                          ],
                        ),
                      ),
                    );
                  },
                  separatorBuilder: (BuildContext context, int index) {
                    return SizedBox(height: 20.px);
                  },
                ),
              ],
            ),
          ),
        ),
        Padding(
          padding: EdgeInsets.only(top: 21.h, left: 20.px, right: 20.px),
          child: Wrap(
            children: [
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  image: DecorationImage(
                    image: AssetImage(ImagePath.reportBox),
                    fit: BoxFit.cover,
                  ),
                ),
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20.px, vertical: 16.px),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          MyTextView(
                            Strings.dailyHealthReport,
                            textStyleNew: MyTextStyle(
                              textColor: controller.appColors.white,
                              textSize: 18.px,
                              textWeight: FontWeight.bold,
                            ),
                          ),
                          MyTextView(
                            controller.date,
                            textStyleNew: MyTextStyle(
                              textColor: controller.appColors.white,
                              textSize: 12.px,
                              textWeight: FontWeight.w500,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 14.px),
                      Row(
                        children: [
                          MyTextView(
                            Strings.enterTodayRecord,
                            textStyleNew: MyTextStyle(
                              textColor: controller.appColors.white,
                              textSize: 12.px,
                              textWeight: FontWeight.w500,
                            ),
                          ),
                          SizedBox(
                            width: 14.w,
                          ),

                          /// --- Add Data --------->>
                          Expanded(
                            child: GestureDetector(
                              onTap: () {
                                Get.toNamed(DailyReportScreen.routes);
                              },
                              child: CommonContainer(
                                height: 40.px,
                                isBorderRadius: true,
                                child: Center(
                                  child: MyTextView(
                                    Strings.addData,
                                    textStyleNew: MyTextStyle(
                                      textColor: controller.appColors.appText,
                                      textSize: 16.px,
                                      textWeight: FontWeight.w600,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          )
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
