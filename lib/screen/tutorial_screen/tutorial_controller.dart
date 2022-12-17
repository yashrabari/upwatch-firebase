import '../../base_controller.dart';
import '../../common/all.dart';
import '../../common/rx_common_model.dart';

class TutorialController extends BaseController {
  RxInt active = 0.obs;
  PageController pages = PageController();
  RxList<RxCommonModel> list = <RxCommonModel>[].obs;

  List<Widget> indicators(imagesLength, currentIndex) {
    return List<Widget>.generate(
      imagesLength,
      (index) {
        return Container(
          margin: const EdgeInsets.all(3),
          width: 2.6.w,
          height: 2.6.h,
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: currentIndex == index ? [appColors.appOrange1, appColors.appOrange2] : [appColors.appGray, Colors.transparent],
            ),
            shape: BoxShape.circle,
          ),
        );
      },
    );
  }

  @override
  void onInit() {
    list.add(
        RxCommonModel(image: ImagePath.tutorialPage1, selectedValue: Strings.tutorialPage1Title, selectedSubValue: Strings.tutorialPage1TitleSub));
    list.add(
        RxCommonModel(image: ImagePath.tutorialPage2, selectedValue: Strings.tutorialPage2Title, selectedSubValue: Strings.tutorialPage2TitleSub));
    list.add(
        RxCommonModel(image: ImagePath.tutorialPage3, selectedValue: Strings.tutorialPage3Title, selectedSubValue: Strings.tutorialPage3TitleSub));
    super.onInit();
  }
}
