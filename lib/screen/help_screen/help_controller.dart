import 'package:upwatch/base_controller.dart';
import 'package:upwatch/common/all.dart';

import '../../common/rx_common_model.dart';

class HelpController extends BaseController {
  List<RxCommonModel> listHelp = <RxCommonModel>[].obs;

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    listHelp.add(RxCommonModel(title: Strings.aboutUs));
    listHelp.add(RxCommonModel(title: Strings.contactUs));
    listHelp.add(RxCommonModel(title: Strings.helpLegal));
    listHelp.add(RxCommonModel(title: Strings.privacyPolicyLabel));
    listHelp.add(RxCommonModel(title: Strings.securityPolicy));
    listHelp.add(RxCommonModel(title: Strings.termsCondition));
  }
}
