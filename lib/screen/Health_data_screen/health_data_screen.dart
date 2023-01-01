import 'package:upwatch/common/all.dart';
import 'package:upwatch/common/constants.dart';
import 'package:upwatch/common/gradiant_app_text.dart';
import 'package:upwatch/screen/Health_data_screen/health_data_controller.dart';
import 'package:upwatch/screen/base_screen.dart';

import '../Health_details_screen/health_details_screen.dart';

class HealthDataScreen extends GetView<HealthDataController> {
  const HealthDataScreen({Key? key}) : super(key: key);
  static const routes = "/HealthDataScreen";

  @override
  Widget build(BuildContext context) {
    Get.put(HealthDataController());
    return BaseScreen(
      child: Column(
        children: [
          Padding(
            padding: EdgeInsets.only(top: 3.5.h),
            child: CommonBackArrow(
              isBack: false,
              isTitle: true,
              title: Strings.healthData,
            ),
          ),
          Expanded(
            child: ListView.builder(
              shrinkWrap: true,
              itemCount: controller.healthData.length,
              physics: BouncingScrollPhysics(),
              padding: EdgeInsets.only(top: 18.px),
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: () {
                    Get.to(HealthDetailsScreen(), arguments: {
                      "title": controller.healthData[index].title,
                      "decimalType": controller.healthData[index].subTitle2,
                      "decimal": controller.healthData[index].subTitle,
                    });
                  },
                  child: Container(
                    margin: EdgeInsets.only(bottom: 2.5.h),
                    padding: EdgeInsets.symmetric(horizontal: 20.px),
                    decoration: BoxDecoration(
                      color: controller.appColors.appText.withOpacity(0.05),
                      borderRadius: BorderRadius.circular(1.h),
                    ),
                    child: Row(
                      children: [
                        Image.asset(
                          controller.healthData[index].image.toString(),
                          height: 12.h,
                          width: 12.w,
                        ),
                        SizedBox(width: 15.px),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            MyTextView(
                              controller.healthData[index].title,
                              textStyleNew: TextStyle(
                                fontFamily: AppFontFamily.GothamRoundedMedium,
                                fontWeight: FontWeight.w400,
                                fontSize: 16.5.sp,
                              ),
                            ),
                            SizedBox(height: 0.5.h),
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                GradientText(
                                  controller.healthData[index].subTitle,
                                  gradient: controller.utils.textGradiant,
                                  style: TextStyle(
                                    fontFamily: AppFontFamily.GothamRoundedMedium,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 18.5.sp,
                                  ),
                                ),
                                SizedBox(width: 1.w),
                                MyTextView(
                                  controller.healthData[index].subTitle2,
                                  textStyleNew: TextStyle(
                                    fontFamily: AppFontFamily.GothamRoundedMedium,
                                    fontWeight: FontWeight.w500,
                                    fontSize: 15.sp,
                                  ),
                                ),
                              ],
                            )
                          ],
                        )
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
