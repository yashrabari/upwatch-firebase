import 'package:carousel_slider/carousel_slider.dart';
import 'package:upwatch/base_controller.dart';
import 'package:upwatch/common/all.dart';

import '../../common/rx_common_model.dart';

class SelectionController extends BaseController {
  RxList<RxCommonModel> listQuestion = <RxCommonModel>[].obs;
  final CarouselController controllerCarousel = CarouselController();
  TextEditingController controllerEmail = TextEditingController();
  RxInt currentCount = 1.obs;
  RxBool is5Sub = false.obs;
  RxBool is6Sub = false.obs;

  RxBool isYes = false.obs;
  RxBool isNo = false.obs;

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    listQuestion.add(RxCommonModel(
      title: "Have you been diagnosed of high cholesterol level?",
      identify: "selection",
      listButton: [RxCommonModel(title: "Yes"), RxCommonModel(title: "No")],
    ));
    listQuestion.add(RxCommonModel(
      title: "Do you have diabetes?",
      identify: "selection",
      listButton: [RxCommonModel(title: "Yes"), RxCommonModel(title: "No")],
    ));
    listQuestion.add(RxCommonModel(
      title: "Do you have high blood pressure?",
      identify: "selection",
      listButton: [RxCommonModel(title: "Yes"), RxCommonModel(title: "No")],
    ));
    listQuestion.add(RxCommonModel(
      title: "Have you ever had a stroke?",
      identify: "selection",
      listButton: [RxCommonModel(title: "Yes"), RxCommonModel(title: "No")],
    ));
    listQuestion.add(RxCommonModel(
      title: "Do you drink alcohol weekly?",
      identify: "selection",
      listButton: [RxCommonModel(title: "Yes"), RxCommonModel(title: "No, but I used to"), RxCommonModel(title: "Never")],
    ));
    listQuestion.add(RxCommonModel(
      title: "How much standard alcohol unit do/did you drink in a week?",
      subTitle: "1 standard unit of alcohol is equivalent to 30ml of Whiskey, 100 ml of Wine or 330ml of Beer",
      identify: "",
      isSub: true,
    ));
    listQuestion.add(RxCommonModel(
      title: "Do you smoke?",
      identify: "selection",
      listButton: [RxCommonModel(title: "Yes"), RxCommonModel(title: "No, but I used to"), RxCommonModel(title: "Never")],
    ));
    listQuestion.add(RxCommonModel(
      title: "How many packs of cigarettes do/ did you smoke in a week?",
      identify: "",
    ));
  }
}
