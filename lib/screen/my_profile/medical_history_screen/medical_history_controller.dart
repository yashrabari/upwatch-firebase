import 'package:upwatch/base_controller.dart';
import 'package:upwatch/common/all.dart';

import '../../../common/rx_common_model.dart';

class MedicalHistoryController extends BaseController {
  AppColors appColors = AppColors();
  Utils utils = Utils();

  TextEditingController alcoholUnit = TextEditingController();
  TextEditingController tobaccoUnit = TextEditingController();

  var selectedCholesterol = 0.obs;
  var selectedDiabetes = 0.obs;
  var selectedBloodPressure = 0.obs;
  var selectedStrokeHistory = 0.obs;
  int? selectedAlcohol = 0;
  var selectedSmoke;
  var alcoholStatus = false.obs;
  var smokeStatus = false.obs;
  RxList<RxCommonModel> listQuestion = <RxCommonModel>[].obs;

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    listQuestion.add(RxCommonModel(
      title: "High Cholesterol",
      identify: "selection",
      listButton: [RxCommonModel(title: "Yes"), RxCommonModel(title: "No")],
      isSelectedAns: [false, false],
    ));
    listQuestion.add(RxCommonModel(
      title: "Diabetes",
      identify: "selection",
      listButton: [RxCommonModel(title: "Yes"), RxCommonModel(title: "No")],
      isSelectedAns: [false, false],
    ));
    listQuestion.add(RxCommonModel(
      title: "High Blood Pressure",
      identify: "selection",
      listButton: [RxCommonModel(title: "Yes"), RxCommonModel(title: "No")],
      isSelectedAns: [false, false],
    ));
    listQuestion.add(RxCommonModel(
      title: "Stroke history",
      identify: "selection",
      listButton: [RxCommonModel(title: "Yes"), RxCommonModel(title: "No")],
      isSelectedAns: [false, false],
    ));
    listQuestion.add(RxCommonModel(
      title: "Alcohol Status",
      identify: "selection",
      listButton: [RxCommonModel(title: "Yes"), RxCommonModel(title: "No, but I used to"), RxCommonModel(title: "Never")],
      isSelectedAns: [false, false, false],
    ));
    listQuestion.add(RxCommonModel(
      title: "Weekly Alcohol Intake\n(Standard alcohol Unit)",
      identify: "",
      isSub: true,
    ));
    listQuestion.add(RxCommonModel(
      title: "Smoking Status",
      identify: "selection",
      listButton: [RxCommonModel(title: "Yes"), RxCommonModel(title: "No, but I used to"), RxCommonModel(title: "Never")],
      isSelectedAns: [false, false, false],
    ));
    listQuestion.add(RxCommonModel(
      title: "Weekly Tobacco Intake (Packs)",
      identify: "",
    ));
  }
}
