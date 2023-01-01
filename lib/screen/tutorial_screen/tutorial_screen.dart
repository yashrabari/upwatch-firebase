import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:upwatch/common/all.dart';
import 'package:upwatch/screen/login_screen/login_screen.dart';
import 'package:upwatch/screen/tutorial_screen/tutorial_controller.dart';

import '../../common/image_path.dart';

class TutorialScreen extends GetView<TutorialController> {
  const TutorialScreen({Key? key}) : super(key: key);
  static const routes = "/TutorialScreen";

  @override
  Widget build(BuildContext context) {
    AppColors appColors = AppColors();
    return GetBuilder<TutorialController>(
      builder: (logic) {
        return Scaffold(
          body: SafeArea(
            top: false,
            bottom: false,
            child: Center(
              child: Stack(
                children: [
                  Padding(
                    padding: EdgeInsets.only(
                      top: MediaQuery.of(context).padding.top,
                    ),
                    child: PageView.builder(
                        physics: const BouncingScrollPhysics(),
                        onPageChanged: (page) {
                          controller.active.value = page;
                          controller.update();
                        },
                        controller: controller.pages,
                        itemCount: controller.list.length,
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (BuildContext context, int index) {
                          return Padding(
                            padding: EdgeInsets.symmetric(horizontal: 6.w),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Padding(
                                  padding: EdgeInsets.all(5.0.w),
                                  child: Image.asset(
                                    controller.list[index].image ?? "",
                                    width: double.infinity,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                                SizedBox(height: 8.h),
                                MyTextView(
                                  controller.list[index].selectedValue,
                                  isMaxLineWrap: true,
                                  textStyleNew: MyTextStyle(
                                    textSize: 22.sp,
                                    textColor: appColors.appText,
                                    textWeight: FontWeight.w500,
                                  ),
                                ),
                                SizedBox(height: 2.h),
                                MyTextView(
                                  controller.list[index].selectedSubValue,
                                  isMaxLineWrap: true,
                                  textStyleNew: MyTextStyle(
                                    textSize: 15.sp,
                                    textColor: appColors.appText,
                                    textWeight: FontWeight.w300,
                                  ),
                                ),
                              ],
                            ),
                          );
                        }),
                  ),
                  Positioned(
                    bottom: MediaQuery.of(context).padding.bottom + 2.h,
                    child: Padding(
                      padding: EdgeInsets.symmetric(horizontal: 6.w),
                      child: Row(
                        children: controller.indicators(controller.list.length, controller.active.value),
                      ),
                    ),
                  ),
                  controller.active.value == 2
                      ? Positioned(
                          right: 6.w,
                          bottom: MediaQuery.of(context).padding.bottom + 2.h,
                          child: GestureDetector(
                            onTap: () {
                              Get.offAndToNamed(LoginScreen.routes);
                            },
                            child: Image.asset(
                              ImagePath.tutorialNext,
                              height: 5.h,
                              width: 5.h,
                              fit: BoxFit.cover,
                            ),
                          ),
                        )
                      : const SizedBox()
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
