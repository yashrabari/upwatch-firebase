import 'package:flutter/material.dart';
import 'package:upwatch/common/all.dart';
import 'package:upwatch/common/common_widget.dart';
import 'package:upwatch/common/constants.dart';
import 'package:upwatch/screen/Mobility_screen/expandble_class.dart';

class ExpansionContainer extends StatelessWidget {
  final List<Widget> children;
  final String title;
  final double height;
  final double? flag;

  ExpansionContainer({
    required this.children,
    required this.title,
    required this.height,
    this.flag,
  });

  @override
  Widget build(BuildContext context) {
    return ExpansionCard(
      title: Container(
          height: 55,
          child: Row(
            children: [
              MyTextView(
                title,
                textStyleNew: TextStyle(
                  color: AppColors().appText,
                  fontFamily: AppFontFamily.GothamRoundedMedium,
                  fontWeight: FontWeight.w400,
                  fontSize: 16.px,
                ),
              ),
            ],
          )),
      children: <Widget>[
        Container(
          padding: EdgeInsets.symmetric(horizontal: 20),
          height: height,
          decoration: BoxDecoration(
              color: AppColors().appText.withOpacity(0.05),
              borderRadius: BorderRadius.vertical(
                bottom: Radius.circular(1.h),
              )),
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 2.w),
            decoration: BoxDecoration(
              color: flag == 1 ? null : Colors.grey.withOpacity(0.1),
              borderRadius: BorderRadius.circular(1.h),
            ),
            margin: EdgeInsets.only(bottom: 20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: children,
            ),
          ),
        )
      ],
    );
  }
}
