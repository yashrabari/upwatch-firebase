import 'package:upwatch/common/constants.dart';
import 'package:upwatch/common/rx_common_model.dart';
import 'package:upwatch/screen/body_measurement_screen/body_measurement_screen.dart';
import 'package:upwatch/screen/my_profile/edit_profile_screen/edit_profile_screen.dart';
import 'package:upwatch/screen/my_profile/medical_history_screen/medical_history_screen.dart';
import 'package:upwatch/screen/my_profile/profile_screen/profile_controller.dart';

import '../../../common/all.dart';
import '../../../common/gradiant_app_text.dart';

class ProfileScreen extends GetView<ProfileController> {
  const ProfileScreen({Key? key}) : super(key: key);
  static const routes = "/ProfileScreen";

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.topCenter,
      children: [
        Container(
          height: 35.h,
          width: double.infinity,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage(ImagePath.homeTopBg),
              fit: BoxFit.cover,
            ),
          ),
          child: Align(
            alignment: Alignment.topLeft,
            child: Padding(
              padding: EdgeInsets.only(top: 60.px, left: 20.px),
              child: GestureDetector(
                onTap: () {
                  Get.back();
                },
                child: Image.asset(
                  ImagePath.backWithBox,
                  height: 41.px,
                  width: 41.px,
                  color: controller.appColors.white,
                ),
              ),
            ),
          ),
        ),
        Padding(
          padding: EdgeInsets.only(top: 30.h),
          child: Container(
            height: 70.h,
            padding: EdgeInsets.only(top: 50.px),
            decoration: BoxDecoration(
              color: controller.appColors.white,
              borderRadius: const BorderRadius.only(
                topRight: Radius.circular(20),
                topLeft: Radius.circular(20),
              ),
            ),
            child: ListView(
              shrinkWrap: true,
              physics: const BouncingScrollPhysics(),
              padding: EdgeInsets.only(top: 30.px),
              children: [
                Column(
                  children: [
                    GradientText(
                      "Jone Lare",
                      gradient: LinearGradient(
                        colors: AppColors.gradiantColor,
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                      ),
                      style: MyTextStyle(
                        textSize: 22.px,
                        textWeight: FontWeight.w600,
                        textFamily: AppFontFamily.GothamRounded,
                      ),
                    ),
                    MyTextView(
                      "ID - 002546",
                      textStyleNew: MyTextStyle(
                        textSize: 20.px,
                        textColor: controller.appColors.appText.withOpacity(0.5),
                        textWeight: FontWeight.w400,
                        textFamily: AppFontFamily.GothamRounded,
                      ),
                    ),
                    SizedBox(height: 22.px),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Column(
                          children: [
                            MyTextView(
                              Strings.age,
                              textStyleNew: MyTextStyle(
                                textSize: 16.px,
                                textColor: controller.appColors.appText.withOpacity(0.5),
                                textWeight: FontWeight.w400,
                                textFamily: AppFontFamily.GothamRounded,
                              ),
                            ),
                            SizedBox(height: 2.px),
                            MyTextView(
                              "24",
                              textStyleNew: MyTextStyle(
                                textSize: 16.px,
                                textColor: controller.appColors.appText,
                                textWeight: FontWeight.w600,
                                textFamily: AppFontFamily.GothamRounded,
                              ),
                            ),
                          ],
                        ),
                        SizedBox(width: 18.w),
                        Image.asset(ImagePath.divider),
                        /* Container(
                          height: 55.px,
                          width: 1.px,
                          decoration: BoxDecoration(
                            gradient: LinearGradient(
                              begin: Alignment.topCenter,
                              end: Alignment.bottomCenter,
                              colors: [
                                controller.appColors.transparent,
                                Color(0xffd9d9d9),
                                controller.appColors.transparent,
                              ],
                            ),
                          ),
                        ),*/
                        SizedBox(width: 18.w),
                        Column(
                          children: [
                            MyTextView(
                              Strings.gender,
                              textStyleNew: MyTextStyle(
                                textSize: 16.px,
                                textColor: controller.appColors.appText.withOpacity(0.5),
                                textWeight: FontWeight.w400,
                                textFamily: AppFontFamily.GothamRounded,
                              ),
                            ),
                            SizedBox(height: 2.px),
                            MyTextView(
                              Strings.male,
                              textStyleNew: MyTextStyle(
                                textSize: 16.px,
                                textColor: controller.appColors.appText,
                                textWeight: FontWeight.w600,
                                textFamily: AppFontFamily.GothamRounded,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                    SizedBox(height: 25.px),
                    ListView.separated(
                      itemCount: controller.profileList.length,
                      shrinkWrap: true,
                      padding: EdgeInsets.symmetric(horizontal: 20.px),
                      physics: NeverScrollableScrollPhysics(),
                      itemBuilder: (context, index) {
                        RxCommonModel obj = controller.profileList[index];
                        return GestureDetector(
                          onTap: () {
                            if (index == 0) {
                              Get.toNamed(EditProfileScreen.routes);
                            } else if (index == 1) {
                              Get.toNamed(MedicalHistoryScreen.routes);
                            } else {
                              Get.to(BodyMeasurementScreen());
                            }
                          },
                          child: CommonContainer(
                            color: controller.appColors.borderColor.withOpacity(0.3),
                            isBorderRadius: true,
                            height: 55.px,
                            child: ListTile(
                              title: MyTextView(
                                obj.title,
                                textStyleNew: MyTextStyle(
                                  textColor: controller.appColors.appText,
                                  textSize: 16.px,
                                  textWeight: FontWeight.w600,
                                ),
                              ),
                              trailing: Image.asset(
                                ImagePath.nextArrowHelp,
                                height: 15.px,
                              ),
                            ),
                          ),
                        );
                      },
                      separatorBuilder: (BuildContext context, int index) {
                        return SizedBox(height: 20.px);
                      },
                    )
                  ],
                ),
              ],
            ),
          ),
        ),
        Padding(
          padding: EdgeInsets.only(top: 22.h),
          child: Stack(
            alignment: Alignment.bottomRight,
            children: [
              ClipOval(
                child: Image.asset(
                  ImagePath.dummyProfile,
                  height: 120.px,
                ),
              ),
              Padding(
                padding: EdgeInsets.only(right: 10.px),
                child: GestureDetector(
                  onTap: () {
                    imagePickerPopUp(context);
                  },
                  child: Image.asset(
                    ImagePath.icEdit,
                    height: 26.px,
                  ),
                ),
              )
            ],
          ),
        )
      ],
    );
  }

  imagePickerPopUp(BuildContext context) {
    showModalBottomSheet(
      context: context,
      backgroundColor: Colors.transparent,
      isScrollControlled: true,
      builder: (context) {
        return CommonBottomSheet(
          borderRadius: 20.px,
          bottomSheetColor: controller.appColors.white,
          widget: Padding(
            padding: EdgeInsets.all(20.px),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 10.px),
                MyTextView(
                  "Choose An Action",
                  textStyleNew: MyTextStyle(
                    textColor: controller.appColors.appText,
                    textSize: 26.px,
                    textWeight: FontWeight.w600,
                  ),
                ),
                SizedBox(height: 35.px),
                Row(
                  children: [
                    Expanded(
                      child: GestureDetector(
                        onTap: () {
                          controller.getFromCamera();
                        },
                        child: CommonContainer(
                          isHeight: false,
                          color: controller.appColors.appText.withOpacity(0.05),
                          isBorderRadius: true,
                          padding: EdgeInsets.symmetric(vertical: 30.px, horizontal: 20.px),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Image.asset(
                                ImagePath.icCamera,
                                height: 40.px,
                              ),
                              SizedBox(height: 25.px),
                              MyTextView(
                                Strings.camera,
                                textStyleNew: MyTextStyle(
                                  textColor: controller.appColors.appText,
                                  textSize: 16.px,
                                  textWeight: FontWeight.w600,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    SizedBox(width: 25.px),
                    Expanded(
                      child: GestureDetector(
                        onTap: () {
                          controller.getFromGallery();
                        },
                        child: CommonContainer(
                          height: 150.px,
                          color: controller.appColors.appText.withOpacity(0.05),
                          isBorderRadius: true,
                          padding: EdgeInsets.symmetric(vertical: 30.px, horizontal: 20.px),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Image.asset(
                                ImagePath.icGallery,
                                height: 40.px,
                              ),
                              SizedBox(height: 25.px),
                              MyTextView(
                                Strings.gallery,
                                textStyleNew: MyTextStyle(
                                  textColor: controller.appColors.appText,
                                  textSize: 16.px,
                                  textWeight: FontWeight.w600,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  /* showCustomDialog(BuildContext context) {
    showGeneralDialog(
      context: context,
      barrierLabel: "Barrier",
      barrierDismissible: true,
      barrierColor: Colors.black.withOpacity(0.5),
      transitionDuration: const Duration(milliseconds: 700),
      pageBuilder: (_, __, ___) {
        return Center(
          child: Container(
            padding: EdgeInsets.all(10),
            margin: EdgeInsets.symmetric(horizontal: 30),
            decoration: BoxDecoration(
              border: Border.all(color: controller.appColors.appText),
              color: controller.appColors.white,
              borderRadius: BorderRadius.circular(
                10,
              ),
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                SizedBox(height: 10.px),
                MyTextView(
                  "Select",
                  textStyleNew: MyTextStyle(
                    textColor: controller.appColors.appText,
                    textWeight: FontWeight.w600,
                    textSize: 22.px,
                  ),
                ),
                SizedBox(height: 25.px),
                Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: 10,
                  ),
                  child: CommonButton(
                    title: Strings.camera.toUpperCase(),
                    height: 45.px,
                    width: double.infinity,
                    onTap: () {
                      controller.getFromCamera();
                    },
                  ),
                ),
                SizedBox(height: 20.px),
                Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: 10,
                  ),
                  child: CommonButton(
                    title: Strings.gallery.toUpperCase(),
                    height: 45.px,
                    width: double.infinity,
                    onTap: () {
                      controller.getFromGallery();
                    },
                  ),
                ),
                SizedBox(height: 10.px),
              ],
            ),
          ),
        );
      },
      transitionBuilder: (_, anim, __, child) {
        Tween<Offset> tween;
        if (anim.status == AnimationStatus.reverse) {
          tween = Tween(begin: const Offset(-1, 0), end: Offset.zero);
        } else {
          tween = Tween(begin: const Offset(1, 0), end: Offset.zero);
        }

        return SlideTransition(
          position: tween.animate(anim),
          child: FadeTransition(
            opacity: anim,
            child: child,
          ),
        );
      },
    );
  }*/
}
