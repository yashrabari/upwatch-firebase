import 'package:upwatch/common/all.dart';
import 'package:upwatch/common/constants.dart';
import 'package:upwatch/common/gradiant_app_text.dart';
import 'package:upwatch/screen/base_screen.dart';
import 'package:upwatch/screen/disease_risk_details/disease_risk_details_screen.dart';
import 'package:upwatch/screen/disease_risk_screen/disease_risk_controller.dart';

class DiseaseRiskScreen extends GetView<DiseaseRiskController> {
  static const routes = "/DiseaseRiskScreenScreen";

  @override
  Widget build(BuildContext context) {
    Get.put(DiseaseRiskController());
    return BaseScreen(
      child: Column(
        children: [
          Padding(
            padding: EdgeInsets.only(top: 3.5.h),
            child: CommonBackArrow(
              isBack: false,
              isTitle: true,
              title: Strings.diseaseRisk,
            ),
          ),
          Expanded(
            child: ListView.separated(
              physics: BouncingScrollPhysics(),
              padding: EdgeInsets.zero,
              shrinkWrap: true,
              itemCount: controller.diseaseRiskList.length,
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: () {
                    Get.to(
                      DiseaseRiskDetailsScreen(),
                      arguments: controller.diseaseRiskList[index],
                    );
                  },
                  child: Container(
                    margin: EdgeInsets.only(bottom: 10),
                    padding: EdgeInsets.all(20.px),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(1.h),
                      color: controller.appColor.textColors.withOpacity(0.1),
                    ),
                    child: Row(
                      children: [
                        index == 3 ? SizedBox(width: 13.px) : SizedBox(),
                        Image.asset(
                          controller.diseaseRiskImageList[index],
                          height: 50.px,
                          fit: BoxFit.fill,
                        ),
                        SizedBox(
                          width: index == 3 ? 6.w : 4.w,
                        ),
                        MyTextView(
                          controller.diseaseRiskList[index],
                          textStyleNew: TextStyle(
                            fontFamily: AppFontFamily.GothamRoundedMedium,
                            fontWeight: FontWeight.w400,
                            fontSize: 18.sp,
                          ),
                        ),
                        Spacer(),
                        GradientText(
                          "90%",
                          gradient: controller.utils.textGradiant,
                          style: TextStyle(
                            fontFamily: AppFontFamily.GothamRoundedMedium,
                            fontWeight: FontWeight.bold,
                            fontSize: 20.sp,
                          ),
                        )
                      ],
                    ),
                  ),
                );
              },
              separatorBuilder: (BuildContext context, int index) {
                return SizedBox(height: 10.px);
              },
            ),
          ),
        ],
      ),
    );
  }
}
