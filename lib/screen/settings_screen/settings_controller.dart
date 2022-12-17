import 'package:upwatch/base_controller.dart';
import 'package:upwatch/common/all.dart';

import '../../common/rx_common_model.dart';

class SettingsController extends BaseController {
  List<RxCommonModel> listSettings = <RxCommonModel>[].obs;

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    listSettings.add(RxCommonModel(title: Strings.myProfile));
    listSettings.add(RxCommonModel(title: Strings.healthDataRecordSetting));
    listSettings.add(RxCommonModel(title: Strings.dashboardSetting));
    listSettings.add(RxCommonModel(title: Strings.smartwatchConnection));
    listSettings.add(RxCommonModel(title: Strings.healthAppConnection));
    listSettings.add(RxCommonModel(title: Strings.getHelp));
    listSettings.add(RxCommonModel(title: Strings.language));
    listSettings.add(RxCommonModel(title: Strings.deleteAccount));
    listSettings.add(RxCommonModel(title: Strings.logout));
  }
}
