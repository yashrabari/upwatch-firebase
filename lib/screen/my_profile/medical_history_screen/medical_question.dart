import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:upwatch/common/app_colors.dart';
import 'package:upwatch/common/common_widget.dart';
import 'package:upwatch/common/constants.dart';
import 'package:upwatch/common/strings.dart';
import 'package:upwatch/common/utils.dart';
import 'package:upwatch/screen/my_profile/medical_history_screen/medical_history_controller.dart';

class MedicalQuestion extends StatefulWidget {
  var selectedValue;
  String? title;
  final String? flag;
  final MedicalHistoryController? medicalHistoryController;

  MedicalQuestion({required this.selectedValue, this.title, this.medicalHistoryController, this.flag});

  @override
  State<MedicalQuestion> createState() => _MedicalQuestionState();
}

class _MedicalQuestionState extends State<MedicalQuestion> {
  List option = [
    Strings.yes,
    Strings.no,
  ];

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: 2.h),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          MyTextView(
            widget.title!,
            textStyleNew: MyTextStyle(
              textFamily: AppFontFamily.GothamRoundedMedium,
              textSize: 16.sp,
              textColor: AppColors().appText,
              textWeight: FontWeight.w500,
            ),
          ),
          SizedBox(
            height: 1.h,
          ),
          Row(
            children: List.generate(
              2,
              (index) => Expanded(
                child: GestureDetector(
                  onTap: () {
                    setState(() {
                      widget.selectedValue == null ? widget.selectedValue = null : widget.selectedValue = index;
                    });
                  },
                  child: Container(
                    padding: EdgeInsets.symmetric(horizontal: 20.px),
                    margin: EdgeInsets.only(
                      right: index == 1 ? 0 : 2.w,
                      left: index == 0 ? 0 : 2.w,
                    ),
                    height: 55.px,
                    decoration: BoxDecoration(
                      color: AppColors().appText.withOpacity(0.05),
                      borderRadius: BorderRadius.circular(1.2.h),
                    ),
                    child: Row(
                      children: [
                        MyTextView(
                          option[index],
                          textStyleNew: MyTextStyle(
                            textSize: 16.sp,
                            textWeight: FontWeight.w500,
                            textColor: AppColors().textColors,
                          ),
                        ),
                        Spacer(),
                        Container(
                          padding: EdgeInsets.all(5),
                          height: 22,
                          width: 22,
                          decoration: BoxDecoration(
                            gradient: widget.selectedValue == index && widget.selectedValue != null ? Utils().textGradiant : null,
                            shape: BoxShape.circle,
                            border: widget.selectedValue == index && widget.selectedValue != null
                                ? null
                                : Border.all(
                                    color: AppColors().textColors,
                                  ),
                          ),
                          child: Container(
                            decoration: BoxDecoration(
                              color: widget.selectedValue == index && widget.selectedValue != null ? Colors.white : null,
                              shape: BoxShape.circle,
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
