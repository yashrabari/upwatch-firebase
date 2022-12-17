import 'package:upwatch/base_controller.dart';
import 'package:upwatch/common/all.dart';

class CommonController extends BaseController {
  String title = "";
  String dummyTextContent = "";

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    if (Get.arguments != null) {
      title = Get.arguments[0];
      dummyTextContent = Strings.dummyText;
    }
  }
}
