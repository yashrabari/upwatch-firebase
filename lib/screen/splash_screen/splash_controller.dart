import 'package:get/get.dart';

import '../tutorial_screen/tutorial_screen.dart';

class SplashController extends GetxController {
  static String? userId = "";
  @override
  void onInit() {
    // if (getStorage.containKey(getStorage.loginData)) {
    //   loginData = LoginModel.fromJson(getStorage.readObject(getStorage.loginData));
    // }
    nextScreen();
    print("objectdsfsdf-*-*-**--*-*---*");

    super.onInit();
  }

  nextScreen() async {
    Future.delayed(const Duration(seconds: 3), () {
      // if (loginData == null) {
      Get.offAndToNamed(TutorialScreen.routes);
      // } else {
      //   userType = loginData!.userType == "Representative"
      //       ? UserType.school
      //       : loginData!.userType == "Admin"
      //       ? UserType.admin
      //       : UserType.student;
      //   Get.offAndToNamed(StudentHomeScreen.routes);
      // }
    });
  }
}
