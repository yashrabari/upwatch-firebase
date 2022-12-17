import 'package:awesome_bottom_bar/awesome_bottom_bar.dart';
import 'package:awesome_bottom_bar/widgets/inspired/inspired.dart';
import 'package:upwatch/common/all.dart';
import 'package:upwatch/screen/Health_data_screen/health_data_screen.dart';
import 'package:upwatch/screen/Mobility_screen/Mobility_screen.dart';
import 'package:upwatch/screen/disease_risk_screen/disease_risk_screen.dart';
import 'package:upwatch/screen/home_screen/home_screen.dart';
import 'package:upwatch/screen/tabbar_screen/tabbar_controller.dart';

import '../settings_screen/settings_screen.dart';

class TabBarScreen extends GetView<TabBarController> {
  const TabBarScreen({Key? key}) : super(key: key);
  static const routes = "/TabBarScreen";

  @override
  Widget build(BuildContext context) {
    return GetBuilder<TabBarController>(
      init: TabBarController(),
      builder: (logic) {
        return Scaffold(
          extendBody: true,
          body: Obx(
            () {
              return controller.visit.value == 0
                  ? const HomeScreen()
                  : controller.visit.value == 1
                      ? HealthDataScreen()
                      : controller.visit.value == 2
                          ? MobilityScreen()
                          : controller.visit.value == 3
                              ? DiseaseRiskScreen()
                              : SettingsScreen();
            },
          ),
          bottomNavigationBar: Obx(() {
            return BottomBarInspiredOutside(
              items: controller.items,
              backgroundColor: Colors.white,
              color: controller.appColors.appText.withOpacity(0.3),
              colorSelected: Colors.white,
              indexSelected: controller.visit.value,
              onTap: (index) {
                printWhite("Index ----> $index");
                controller.visit.value = index;
                printWhite("visit ----> ${controller.visit}");
              },
              padTop: 15,
              sizeInside: 50,
              fixed: true,
              elevation: 10,
              fixedIndex: controller.visit.value,
              curve: Curves.easeOutCirc,
              animated: true,
              itemStyle: ItemStyle.circle,
              borderRadius: const BorderRadius.only(topLeft: Radius.circular(30), topRight: Radius.circular(30)),
              chipStyle: const ChipStyle(notchSmoothness: NotchSmoothness.defaultEdge),
              isAnimated: true,
              radius: 30,
            );
          }),
        );
      },
    );
  }
}
