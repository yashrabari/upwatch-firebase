import 'package:carousel_slider/carousel_slider.dart';
import 'package:upwatch/base_controller.dart';
import 'package:upwatch/common/all.dart';
import 'package:vertical_weight_slider/vertical_weight_slider.dart';

import '../../common/rx_common_model.dart';

class MeasurementSelectionController extends BaseController {
  RxList<RxCommonModel> listQuestion = <RxCommonModel>[].obs;
  final CarouselController controllerCarousel = CarouselController();
  final WeightSliderController controllerWeight = WeightSliderController(initialWeight: 50, minWeight: 35, interval: 0.1);
  RxInt currentCount = 1.obs;
  RxDouble selectedWeight = 50.0.obs;
  RxInt initialPage = 20.obs;
  List<int> listCounting = [];

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    listCounting = [140, 141, 142, 143, 144, 145, 146, 147, 148, 149, 150, 151, 152, 153, 154, 155, 156, 157, 158, 159, 160, 161, 162, 163, 164, 165, 166, 167, 168, 169, 170, 171, 172, 173, 174, 175, 176, 177, 178, 179, 180, 180, 182, 183, 184, 185, 186, 187, 188, 189, 190, 191, 192, 193, 194, 195, 196, 197, 198, 199, 200];
    listQuestion.add(RxCommonModel(
      title: "What is your body height in CM?",
    ));
    listQuestion.add(RxCommonModel(
      title: "What is your body weight in KG?",
    ));
  }
}
