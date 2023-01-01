import '../../common/all.dart';
import '../base_screen.dart';
import 'common_controller.dart';

class CommonScreen extends GetView<CommonController> {
  const CommonScreen({
    Key? key,
  }) : super(key: key);
  static const routes = "/CommonScreen";

  @override
  Widget build(BuildContext context) {
    AppColors appColors = AppColors();
    return GetBuilder<CommonController>(
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
                  title: controller.title,
                ),
              ),
              Expanded(
                child: ListView(
                  shrinkWrap: true,
                  padding: EdgeInsets.zero,
                  physics: BouncingScrollPhysics(),
                  children: [
                    MyTextView(
                      controller.dummyTextContent,
                      isMaxLineWrap: true,
                      textAlignNew: TextAlign.start,
                      textStyleNew: MyTextStyle(
                        textSize: 16.sp,
                        textColor: appColors.appText,
                        textWeight: FontWeight.normal,
                      ),
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
