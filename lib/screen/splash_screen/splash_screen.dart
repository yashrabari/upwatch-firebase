import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:upwatch/common/image_path.dart';
import 'package:upwatch/screen/splash_screen/splash_controller.dart';

class SplashScreen extends GetView<SplashController> {
  const SplashScreen({Key? key}) : super(key: key);
  static const routes = "/SplashScreen";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        top: false,
        bottom: false,
        child: Stack(
          children: [
            Image.asset(
              ImagePath.appSplashBg,
              height: double.infinity,
              width: double.infinity,
              fit: BoxFit.cover,
            ),
            Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Image.asset(
                    ImagePath.appSplashLogo,
                    height: 100.px,
                  ),
                  SizedBox(height: 35.px),
                  Image.asset(
                    ImagePath.appSplashLogoText,
                    height: 30.px,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
