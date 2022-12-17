import 'package:flutter/material.dart';
import 'package:upwatch/common/all.dart';
import 'package:upwatch/common/constants.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final bool? centerTitle;
  final bool? isLeading;
  final String? title;

  CustomAppBar({
    this.centerTitle,
    this.isLeading = false,
    this.title,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      elevation: 0,
      backgroundColor: Colors.transparent,
      centerTitle: centerTitle,
      title: MyTextView(title ?? "",
          textStyleNew: TextStyle(
            fontFamily: AppFontFamily.GothamRoundedMedium,
            fontWeight: FontWeight.w400,
            fontSize: 21.sp,
          )),
      automaticallyImplyLeading: false,
      leading: isLeading == true
          ? GestureDetector(
              onTap: () {
                Get.back();
              },
              child: Padding(
                padding: EdgeInsets.only(left: AppDimensions().horizontalWholeApp),
                child: Image.asset(ImagePath.backWithBox),
              ),
            )
          : null,
    );
  }

  @override
  // TODO: implement preferredSize
  Size get preferredSize => Size(double.infinity, 60);
}
