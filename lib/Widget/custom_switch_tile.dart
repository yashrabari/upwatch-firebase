import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:upwatch/common/app_colors.dart';
import 'package:upwatch/common/common_widget.dart';
import 'package:upwatch/common/constants.dart';

import '../common/image_path.dart';

class CustomSwitchTile extends StatefulWidget {
  final String? title;
  bool? isSwitch;

  CustomSwitchTile({this.title, this.isSwitch});

  @override
  State<CustomSwitchTile> createState() => _CustomSwitchTileState();
}

class _CustomSwitchTileState extends State<CustomSwitchTile> {
  @override
  Widget build(BuildContext context) {
    return Container(
        // padding: EdgeInsets.symmetric(horizontal: 18.px),
        margin: EdgeInsets.only(bottom: 20.px),
        height: 55.px,
        width: double.infinity,
        decoration: BoxDecoration(
          color: AppColors().textColors.withOpacity(0.1),
          borderRadius: BorderRadius.circular(1.2.h),
        ),
        child: ListTile(
          title: MyTextView(
            widget.title,
            // isMaxLineWrap: true,
            textStyleNew: MyTextStyle(
              textFamily: AppFontFamily.GothamRoundedMedium,
              textSize: 16.px,
              textColor: AppColors().appText,
              textWeight: FontWeight.w500,
            ),
          ),
          trailing: GestureDetector(
            onTap: () {
              setState(() {
                widget.isSwitch = !widget.isSwitch!;
              });
            },
            child: Image.asset(
              widget.isSwitch! ? ImagePath.switchOff : ImagePath.switchOn,
              height: 30,
              width: 40,
            ),
          ),
        ) /*Row(
        children: [
          MyTextView(
            widget.title,
            // isMaxLineWrap: true,
            textStyleNew: MyTextStyle(
              textFamily: AppFontFamily.GothamRoundedMedium,
              textSize: 15.px,
              textColor: AppColors().appText,
              textWeight: FontWeight.w500,
            ),
          ),
          Spacer(),
          GestureDetector(
            onTap: () {
              setState(() {
                widget.isSwitch = !widget.isSwitch!;
              });
            },
            child: Image.asset(
              widget.isSwitch! ? ImagePath.switchOff : ImagePath.switchOn,
              height: 30,
              width: 40,
            ),
          ),
        ],
      ),*/
        );
  }
}
