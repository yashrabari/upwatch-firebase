import 'package:upwatch/base_controller.dart';
import 'package:upwatch/common/all.dart';

import '../../common/rx_common_model.dart';

class DeleteAccountController extends BaseController {
  List<RxCommonModel> listSettings = <RxCommonModel>[].obs;
  int selectedIndex = -1;

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    listSettings.add(RxCommonModel(title: Strings.iDoNotLike));
    listSettings.add(RxCommonModel(title: Strings.someErrorForThisApp));
    listSettings.add(RxCommonModel(title: Strings.other));
  }
}
