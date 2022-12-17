import 'package:upwatch/base_controller.dart';
import 'package:upwatch/common/all.dart';
import 'package:upwatch/common/rx_common_model.dart';

class HomeController extends BaseController {
  Utils utils = Utils();
  RxList<RxCommonModel> homeList = [
    RxCommonModel(title: Strings.bloodGlucose, subTitle: "00", subTitle2: Strings.mgDl, image: ImagePath.bloodGlucose),
    RxCommonModel(title: Strings.bloodOxygen, subTitle: "00", subTitle2: "%", image: ImagePath.bloodOxygen),
    RxCommonModel(title: Strings.bloodPressure, subTitle: "000/00", subTitle2: Strings.mmHg, image: ImagePath.bloodPressure),
    RxCommonModel(title: Strings.bodyTemperature, subTitle: "0c", subTitle2: Strings.degree, image: ImagePath.bodyTemperature),
    RxCommonModel(title: Strings.bodyWeight, subTitle: "0", subTitle2: Strings.kg, image: ImagePath.bodyWeight),
  ].obs;

  String? date;

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    date = utils.changeDateFormat(date: DateTime.now(), outputFormat: 'dd MMM yyyy');
  }
}
