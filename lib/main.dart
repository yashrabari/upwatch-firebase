import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:upwatch/routes/app_pages.dart';
import 'package:upwatch/screen/splash_screen/splash_binding.dart';
import 'package:upwatch/screen/splash_screen/splash_screen.dart';

import 'common/app_colors.dart';
import 'common/constants.dart';
import 'common/strings.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ResponsiveSizer(
      builder: (context, orientation, screenType) => GetMaterialApp(
        title: Strings.appName,
        debugShowCheckedModeBanner: false,
        getPages: AppPages.list,
        builder: EasyLoading.init(),
        theme: ThemeData(
          primarySwatch: AppColors.primerColor,
          fontFamily: AppFontFamily.GothamRounded,
        ),
        initialBinding: SplashBinding(),
        home: const SplashScreen(),
      ),
    );
  }
}
