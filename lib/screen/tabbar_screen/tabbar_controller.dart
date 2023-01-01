import 'package:awesome_bottom_bar/tab_item.dart';
import 'package:upwatch/base_controller.dart';

import '../../common/all.dart';
import '../home_screen/home_controller.dart';
import '../settings_screen/settings_controller.dart';

class TabBarController extends BaseController {
  List<TabItem> items = [
    TabItem(
      icon: ImagePath.icHome,
    ),
    TabItem(
      icon: ImagePath.icHealthData,
    ),
    TabItem(
      icon: ImagePath.icMobility,
    ),
    TabItem(
      icon: ImagePath.icDiseaseRisk,
    ),
    TabItem(
      icon: ImagePath.icSettings,
    ),
  ];

  RxInt visit = 0.obs;

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    Get.put<HomeController>(HomeController());
    Get.put<SettingsController>(SettingsController());
  }
}
