import 'package:flutter/services.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../../common/all.dart';
import 'constants.dart';
import 'image_path.dart';

/// <<<--- To get text View -------------------->>>
class MyTextView extends Text {
  final TextAlign? textAlignNew;
  final int? maxLinesNew;
  final TextStyle? textStyleNew;
  final TextOverflow? overflowText;
  final bool? isMaxLineWrap;
  final TextDirection? textAlignment;

  MyTextView(
    String? s, {
    Key? key,
    this.textAlignment,
    this.textAlignNew = TextAlign.start,
    this.maxLinesNew = 1,
    this.overflowText = TextOverflow.ellipsis,
    this.isMaxLineWrap = false,
    this.textStyleNew,
  })  : assert(s != null && maxLinesNew != null),
        super(
          s!,
          key: key,
          textAlign: textAlignNew,
          maxLines: isMaxLineWrap! ? null : maxLinesNew,
          overflow: isMaxLineWrap ? null : overflowText,
          style: textStyleNew,
          textDirection: textAlignment,
        );
}

/// <<<--- To get text view style --------------->>>
class MyTextStyle extends TextStyle {
  final Color? textColor;
  final FontWeight? textWeight;
  final double? textSize;
  final String? textFamily;
  final TextDecoration? textDecorations;
  final Paint? textBackground;
  final double? textLetterSpacing;
  final double? textHeight;
  final FontStyle? textStyle;
  final double? textDecorationThickness;
  final Paint? foreground;

  const MyTextStyle({
    this.textHeight = 1.3,
    this.textColor = Colors.white,
    this.textWeight = FontWeight.normal,
    this.textSize = 14,
    this.textFamily = AppFontFamily.GothamRounded,
    this.textDecorations = TextDecoration.none,
    this.textBackground,
    this.textLetterSpacing = 0.0,
    this.textStyle = FontStyle.normal,
    this.textDecorationThickness = 1.0,
    this.foreground,
  })  : assert(textColor != null && textWeight != null),
        super(
          color: textColor,
          fontWeight: textWeight,
          fontSize: textSize,
          fontFamily: textFamily,
          decoration: textDecorations,
          background: textBackground,
          letterSpacing: textLetterSpacing,
          height: textHeight,
          fontStyle: textStyle,
          decorationThickness: textDecorationThickness,
          foreground: foreground,
        );
}

/// <<<--- Common Button ------------------------>>>
class CommonButton extends StatelessWidget {
  final GestureTapCallback? onTap;
  final String? title;
  final double? borderRadius;
  final double? height;
  final double? width;
  final bool? isWidth;
  final Color? buttonColor;
  final bool? isBorder;
  final Color? borderColor;
  final double? borderWidth;
  final Color? textColor;
  final double textSize;
  final FontWeight? textWeight;

  const CommonButton({
    Key? key,
    required this.onTap,
    required this.title,
    this.borderRadius,
    this.height,
    this.width,
    this.isWidth = false,
    this.buttonColor,
    this.isBorder = false,
    this.borderColor,
    this.borderWidth = 1,
    this.textColor,
    this.textSize = 18,
    this.textWeight,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    AppColors appColors = AppColors();
    return GestureDetector(
      onTap: onTap,
      child: Container(
        clipBehavior: Clip.none,
        height: height ?? 4.h,
        width: isWidth != null ? width!.w : null,
        decoration: BoxDecoration(
          // color: buttonColor ?? appColors.buttonBackGroundColor,
          gradient: LinearGradient(colors: [
            appColors.btnStart,
            appColors.btnEnd,
          ], begin: Alignment.topCenter, end: Alignment.bottomCenter, tileMode: TileMode.mirror),
          borderRadius: BorderRadius.circular(borderRadius ?? 360),
          border: isBorder! ? Border.all(color: borderColor ?? appColors.black, width: borderWidth!) : null,
        ),
        child: Center(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 15.px),
            child: CommonMediumText(
              title: title!,
              isMaxLineWrap: true,
              textSize: textSize,
              textAlignNew: TextAlign.center,
              textColor: textColor ?? appColors.white,
            ),
          ),
        ),
      ),
    );
  }
}

/// <<<--- Common Bottom Sheet ----------------------->>>
class CommonBottomSheet extends StatelessWidget {
  final Widget? widget;
  final double? borderRadius;
  final Color? bottomSheetColor;
  final bool? isSlider;
  final Color? sliderColor;
  final double? sliderHeight;
  final double? sliderWidth;

  const CommonBottomSheet({
    Key? key,
    this.widget,
    this.borderRadius = 25,
    this.bottomSheetColor,
    this.isSlider = false,
    this.sliderColor,
    this.sliderHeight,
    this.sliderWidth,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    AppColors appColors = AppColors();
    return SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
        child: Stack(
          alignment: Alignment.topCenter,
          children: [
            Visibility(
              visible: isSlider!,
              child: Container(
                height: sliderHeight ?? 6,
                width: sliderWidth ?? 50,
                decoration: BoxDecoration(
                  color: sliderColor ?? appColors.white,
                  borderRadius: BorderRadius.circular(
                    5,
                  ),
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 15),
              decoration: BoxDecoration(
                color: bottomSheetColor ?? appColors.white,
                borderRadius: BorderRadius.only(
                  topRight: Radius.circular(borderRadius!),
                  topLeft: Radius.circular(borderRadius!),
                ),
              ),
              child: widget,
            ),
          ],
        ),
      ),
    );
  }
}

/// <<<--- Common Text Field ---------------------->>>
class CommonTextField extends StatelessWidget {
  final TextEditingController? controller;
  final Color? cursorColor;
  final TextInputType? inputType;
  final bool? enabled;
  final bool obscureText;
  final bool? isMaxLines;
  final int? maxLines;
  final TextInputAction? textInputAction;
  final ValueChanged<String>? onSubmit;
  final ValueChanged<String>? onChange;
  final GestureTapCallback? onTap;
  final TextAlign? textAlign;
  final FocusNode? focusNode;
  final int? maxLength;
  final int? minLines;
  final List<TextInputFormatter>? inputFormat;
  final TextStyle? textStyle;
  final FontWeight? textWeight;
  final double textSize;
  final Color? textColor;
  final String? hintText;
  final FontWeight? hintTextWeight;
  final TextStyle? hintTextStyle;
  final double? hintTextSize;
  final Color? hintColor;

  const CommonTextField({
    Key? key,
    required this.controller,
    this.cursorColor,
    this.inputType,
    this.enabled = true,
    this.obscureText = false,
    this.isMaxLines = false,
    this.maxLines = 1,
    this.textInputAction = TextInputAction.next,
    this.onSubmit,
    this.onChange,
    this.onTap,
    this.textAlign = TextAlign.start,
    this.focusNode,
    this.maxLength,
    this.minLines,
    this.inputFormat,
    this.textStyle,
    this.textWeight,
    this.textSize = 14,
    this.textColor,
    this.hintText,
    this.hintTextWeight,
    this.hintTextStyle,
    this.hintTextSize,
    this.hintColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    AppColors appColors = AppColors();
    return TextField(
      controller: controller,
      cursorColor: cursorColor ?? appColors.buttonBackGroundColor,
      keyboardType: inputType,
      enabled: enabled,
      obscureText: obscureText,
      obscuringCharacter: "*",
      maxLines: isMaxLines! ? null : maxLines,
      textInputAction: textInputAction,
      onSubmitted: onSubmit,
      onChanged: onChange,
      onTap: onTap,
      textAlign: textAlign!,
      autocorrect: false,
      autofocus: false,
      focusNode: focusNode,
      maxLength: maxLength,
      minLines: minLines,
      inputFormatters: inputFormat,
      style: textStyle ??
          MyTextStyle(
            textWeight: textWeight ?? FontWeight.w400,
            textSize: textSize,
            textColor: textColor ?? appColors.buttonBackGroundColor.withOpacity(0.9),
          ),
      decoration: InputDecoration(
        isDense: true,
        border: InputBorder.none,
        hintText: hintText,
        counter: null,
        counterText: "",
        contentPadding: EdgeInsets.symmetric(vertical: 2.h),
        hintStyle: hintTextStyle ??
            MyTextStyle(
              textColor: hintColor ?? appColors.buttonBackGroundColor.withOpacity(0.5),
              textWeight: hintTextWeight ?? FontWeight.w400,
              textSize: textSize.sp,
            ),
      ),
    );
  }
}

/// <<<--- Common Drop Down ------------------------>>>
class CommonDropDown extends StatelessWidget {
  final ValueChanged<String?> onChanged;
  final List<String>? itemsList;
  final String? dropdownValue;
  final Widget? icon;
  final int? elevation;
  final Color? dropdownColor;
  final Color? textColor;
  final double textSize;
  final FontWeight? textWeight;
  final double? textHeight;
  final AlignmentGeometry? alignment;
  final bool? autofocus;
  final Color? focusColor;
  final double? iconSize;
  final bool? isExpanded;
  final bool? isDense;
  final Color? iconDisabledColor;
  final Color? iconEnabledColor;
  final Widget? underline;
  final double? menuMaxHeight;

  const CommonDropDown({
    Key? key,
    required this.onChanged,
    required this.itemsList,
    this.dropdownValue,
    this.icon,
    this.elevation,
    this.dropdownColor,
    this.textColor,
    this.textSize = 14,
    this.textWeight,
    this.textHeight,
    this.alignment,
    this.autofocus,
    this.focusColor,
    this.iconSize,
    this.isExpanded,
    this.isDense,
    this.iconDisabledColor,
    this.iconEnabledColor,
    this.underline,
    this.menuMaxHeight,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    AppColors appColors = AppColors();

    return DropdownButton(
      hint: const Text("Select"),
      value: dropdownValue,
      icon: icon,
      dropdownColor: dropdownColor ?? appColors.white,
      borderRadius: BorderRadius.circular(10),
      elevation: elevation ?? 8,
      style: MyTextStyle(
        textColor: textColor ?? appColors.buttonBackGroundColor,
        textSize: textSize,
        textWeight: textWeight ?? FontWeight.w400,
        textHeight: textHeight,
      ),
      alignment: alignment ?? Alignment.center,
      autofocus: autofocus ?? false,
      focusColor: focusColor,
      iconSize: iconSize ?? 24.0,
      isExpanded: isExpanded ?? false,
      isDense: isDense ?? false,
      iconDisabledColor: iconDisabledColor,
      iconEnabledColor: iconEnabledColor,
      underline: underline,
      menuMaxHeight: menuMaxHeight,
      onChanged: onChanged,
      items: itemsList!.map((String value) {
        return DropdownMenuItem(
          value: value,
          child: MyTextView(value),
        );
      }).toList(),
    );
  }
}

/// <<<--- Common Container -------------------->>>
class CommonContainer extends StatelessWidget {
  final Widget? child;
  final bool? isHeight;
  final double? height;
  final bool? isWidth;
  final double? width;
  final EdgeInsetsGeometry? padding;
  final EdgeInsetsGeometry? margin;
  final AlignmentGeometry? alignment;
  final Color? color;
  final bool? isBorder;
  final Color? borderColor;
  final double? borderWidth;
  final bool? isBorderRadius;
  final double? borderRadius;
  final bool? isBoxShadow;
  final Color? boxShadowColor;
  final double? boxShadowBlurRadius;
  final double? boxShadowSpreadRadius;
  final Offset? boxShadowOffset;
  final Gradient? gradient;

  const CommonContainer({
    Key? key,
    this.child,
    this.isHeight = true,
    this.height,
    this.isWidth = false,
    this.width,
    this.padding,
    this.margin,
    this.alignment,
    this.color,
    this.isBorder = false,
    this.borderColor,
    this.borderWidth = 1,
    this.isBorderRadius = false,
    this.borderRadius = 8,
    this.isBoxShadow = false,
    this.boxShadowColor,
    this.boxShadowBlurRadius = 10,
    this.boxShadowSpreadRadius = 1.8,
    this.boxShadowOffset = Offset.zero,
    this.gradient,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: isHeight! ? height ?? 45 : null,
      width: isWidth! ? width! : double.infinity,
      padding: padding,
      margin: margin,
      alignment: alignment,
      decoration: BoxDecoration(
        color: color ?? Colors.white,
        border: isBorder!
            ? Border.all(
                color: borderColor ?? Colors.black,
                width: borderWidth!,
              )
            : null,
        borderRadius: isBorderRadius! ? BorderRadius.circular(borderRadius!) : null,
        gradient: gradient,
      ),
      child: child,
    );
  }
}

/// <<<--- Add your common widget hear ----------->>>
/// ↓ ↓ ↓ ↓ ↓ ↓ ↓ ↓ ↓ ↓ ↓ ↓ ↓ ↓ ↓ ↓ ↓ ↓ ↓ ↓ ↓ ↓ ↓ ///
class CommonRegularText extends StatelessWidget {
  final String? title;
  final Color? textColor;
  final double textSize;
  final int? maxLinesNew;
  final TextAlign? textAlignNew;
  final bool? isMaxLineWrap;

  const CommonRegularText({
    Key? key,
    this.title = "",
    this.textColor,
    this.textSize = 14,
    this.maxLinesNew,
    this.textAlignNew,
    this.isMaxLineWrap = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    AppColors appColors = AppColors();
    return MyTextView(
      title,
      textAlignNew: textAlignNew,
      isMaxLineWrap: isMaxLineWrap,
      textStyleNew: MyTextStyle(
        textColor: textColor ?? appColors.buttonBackGroundColor,
        textWeight: FontWeight.w400,
        textSize: textSize.sp,
      ),
      maxLinesNew: maxLinesNew ?? 1,
    );
  }
}

class CommonMediumText extends StatelessWidget {
  final String? title;
  final Color? textColor;
  final double textSize;
  final int? maxLinesNew;
  final TextAlign? textAlignNew;
  final bool? isMaxLineWrap;
  final TextStyle? textStyle;

  const CommonMediumText({
    Key? key,
    this.title = "",
    this.textColor,
    this.textSize = 22,
    this.maxLinesNew,
    this.textAlignNew,
    this.textStyle,
    this.isMaxLineWrap = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    AppColors appColors = AppColors();
    return MyTextView(
      title,
      textAlignNew: textAlignNew,
      isMaxLineWrap: isMaxLineWrap,
      textStyleNew: textStyle ??
          MyTextStyle(
            textColor: textColor ?? appColors.appText,
            textWeight: FontWeight.w600,
            textSize: textSize,
          ),
      maxLinesNew: maxLinesNew ?? 1,
    );
  }
}

class CommonBoldText extends StatelessWidget {
  final String? title;
  final Color? textColor;
  final double? textSize;
  final int? maxLinesNew;
  final TextAlign? textAlignNew;
  final bool? isMaxLineWrap;

  const CommonBoldText({
    Key? key,
    this.title = "",
    this.textColor,
    this.textSize,
    this.maxLinesNew,
    this.textAlignNew,
    this.isMaxLineWrap = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    AppColors appColors = AppColors();
    return MyTextView(
      title,
      textAlignNew: textAlignNew,
      isMaxLineWrap: isMaxLineWrap,
      textStyleNew: MyTextStyle(
        textColor: textColor ?? appColors.buttonBackGroundColor,
        textWeight: FontWeight.bold,
        textSize: 14.dp,
      ),
      maxLinesNew: maxLinesNew ?? 1,
    );
  }
}

class CommonAppBar extends StatelessWidget {
  final String? title;
  final bool isLeftButton;
  final bool isRightButton;
  final String? rightButtonImage;
  final GestureTapCallback? onTapRight;
  final double heightAdd;
  final double? rightButtonHeight;
  final double fontSize;

  const CommonAppBar({
    Key? key,
    this.title = "",
    this.isLeftButton = false,
    this.isRightButton = false,
    this.rightButtonImage = "",
    this.onTapRight,
    this.heightAdd = 0.0,
    this.fontSize = 16,
    this.rightButtonHeight,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    AppColors appColors = AppColors();
    return Container(
      padding: EdgeInsets.only(
        top: MediaQuery.of(context).padding.top,
      ),
      height: MediaQuery.of(context).padding.top + AppBar().preferredSize.height + heightAdd.px,
      width: double.infinity,
      color: appColors.themeColor,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 2.0.px),
        child: Row(
          children: [
            Visibility(
              visible: (!isLeftButton && !isRightButton) ? false : true,
              child: GestureDetector(
                behavior: HitTestBehavior.opaque,
                onTap: () {
                  Get.back();
                },
                child: Visibility(
                  visible: isLeftButton,
                  replacement: SizedBox(
                    height: isRightButton ? AppBar().preferredSize.height / 1.2 : AppBar().preferredSize.height / 1.8,
                    width: isRightButton ? AppBar().preferredSize.height / 1.2 : AppBar().preferredSize.height / 1.8,
                  ),
                  child: Center(
                    child: Image.asset(
                      ImagePath.backButton,
                      height: AppBar().preferredSize.height / 1.8,
                      width: AppBar().preferredSize.height / 1.8,
                    ),
                  ),
                ),
              ),
            ),
            Expanded(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 2.0.px),
                child: MyTextView(
                  title,
                  maxLinesNew: 2,
                  textAlignNew: TextAlign.center,
                  overflowText: TextOverflow.ellipsis,
                  textStyleNew: MyTextStyle(
                    textHeight: 1,
                    textColor: appColors.white,
                    textSize: fontSize.dp,
                    textWeight: FontWeight.w400,
                  ),
                ),
              ),
            ),
            Visibility(
              visible: (!isLeftButton && !isRightButton) ? false : true,
              child: GestureDetector(
                behavior: HitTestBehavior.opaque,
                onTap: onTapRight,
                child: Visibility(
                  visible: isRightButton,
                  replacement: SizedBox(
                    height: AppBar().preferredSize.height / 1.8,
                    width: AppBar().preferredSize.height / 1.8,
                  ),
                  child: Container(
                    height: AppBar().preferredSize.height / 1.2,
                    width: AppBar().preferredSize.height / 1.2,
                    decoration: BoxDecoration(
                      color: appColors.white,
                      border: Border.all(color: appColors.buttonBackGroundColor.withOpacity(0.12)),
                      shape: BoxShape.circle,
                    ),
                    child: Center(
                      child: Image.asset(
                        rightButtonImage!,
                        height: rightButtonHeight ?? AppBar().preferredSize.height / 2,
                        width: rightButtonHeight ?? AppBar().preferredSize.height / 2,
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class TitledTextField extends StatelessWidget {
  final String titleText;
  final TextEditingController controller;
  final TextInputType inputType;
  final TextInputAction? textInputAction;
  final bool obscureText;
  final bool isHeight;
  final double? topSpace;
  final double topSpaceHintText;
  final int maxLine;
  final bool isRightImage;
  final String? rightImage;
  final GestureTapCallback? rightImageTap;
  final GestureTapCallback? onTap;
  final bool? enabled;

  const TitledTextField({
    Key? key,
    required this.titleText,
    required this.controller,
    this.obscureText = false,
    this.isHeight = true,
    this.inputType = TextInputType.text,
    this.textInputAction = TextInputAction.next,
    this.topSpace = 10,
    this.topSpaceHintText = 0,
    this.maxLine = 1,
    this.isRightImage = false,
    this.enabled = true,
    this.rightImage,
    this.rightImageTap,
    this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        CommonMediumText(title: titleText),
      ],
    );
  }
}

class CommonTextFieldWithTitle extends StatelessWidget {
  final String titleText;
  final String hintText;
  final TextEditingController controller;
  final TextInputType inputType;
  final TextInputAction? textInputAction;
  final bool obscureText;
  final bool isHeight;
  final double? topSpace;
  final int maxLine;
  final int? minLines;
  final bool isRightImage;
  final String rightImage;
  final GestureTapCallback? rightImageTap;
  final GestureTapCallback? onTap;
  final bool? enabled;
  final TextStyle? titleStyle;
  final TextStyle? textFieldStyle;
  final TextStyle? hintTextStyle;
  final int? maxLinesNew;

  const CommonTextFieldWithTitle({
    Key? key,
    required this.titleText,
    required this.controller,
    this.obscureText = false,
    this.isHeight = false,
    this.inputType = TextInputType.text,
    this.textInputAction = TextInputAction.next,
    this.topSpace = 10,
    this.maxLine = 1,
    this.minLines = 1,
    this.isRightImage = false,
    this.enabled = true,
    this.rightImage = "",
    this.rightImageTap,
    this.onTap,
    this.titleStyle,
    this.hintTextStyle,
    this.textFieldStyle,
    this.hintText = "",
    this.maxLinesNew = 1,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    AppColors appColors = AppColors();

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        titleText.isNotEmpty
            ? Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  SizedBox(height: 2.0.h),
                  Padding(
                    padding: EdgeInsets.symmetric(vertical: 5.0.px),
                    child: CommonMediumText(title: titleText, maxLinesNew: maxLinesNew, textStyle: titleStyle),
                  ),
                ],
              )
            : const SizedBox(),
        SizedBox(height: 5.px),
        GestureDetector(
          onTap: onTap,
          child: Container(
            height: isHeight ? 6.h : null,
            decoration: BoxDecoration(
              color: appColors.borderColor.withOpacity(0.3),
              borderRadius: BorderRadius.circular(8.0.px),
              border: Border.all(
                color: appColors.borderColor.withOpacity(0.3),
              ),
            ),
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.px),
              child: Center(
                child: Row(
                  children: [
                    Expanded(
                      child: CommonTextField(
                        inputType: inputType,
                        controller: controller,
                        hintText: hintText,
                        textInputAction: textInputAction,
                        obscureText: obscureText,
                        enabled: enabled,
                        maxLines: maxLine,
                        hintTextStyle: hintTextStyle,
                        textStyle: textFieldStyle,
                        minLines: minLines,
                      ),
                    ),
                    Visibility(
                      visible: isRightImage && rightImage.isNotEmpty,
                      child: GestureDetector(
                        behavior: HitTestBehavior.opaque,
                        onTap: rightImageTap,
                        child: SizedBox(
                          height: 20.px,
                          width: 20.px,
                          child: Image.asset(
                            rightImage,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class CommonDropdownWithTitle extends StatelessWidget {
  final String titleText;
  final ValueChanged<String?> onChanged;
  final List<String> itemsList;
  final String dropdownValue;
  final GestureTapCallback? onTap;

  const CommonDropdownWithTitle({
    Key? key,
    required this.titleText,
    required this.itemsList,
    required this.onChanged,
    this.dropdownValue = "Select",
    this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(height: 1.0.h),
        Padding(
          padding: EdgeInsets.symmetric(vertical: 5.0.px),
          child: CommonMediumText(title: titleText, textSize: 16.px),
        ),
        SizedBox(height: 5.px),
        GestureDetector(
          onTap: onTap,
          child: CommonDropdownWithContainer(
            dropdownValue: dropdownValue,
            onChanged: onChanged,
            itemsList: itemsList,
          ),
        ),
      ],
    );
  }
}

class CommonDropdownWithContainer extends StatelessWidget {
  final ValueChanged<String?> onChanged;
  final List<String>? itemsList;
  final String? dropdownValue;

  const CommonDropdownWithContainer({
    Key? key,
    required this.onChanged,
    this.itemsList,
    this.dropdownValue,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    AppColors appColors = AppColors();
    return Container(
      height: 55.px,
      decoration: BoxDecoration(
        color: appColors.borderColor.withOpacity(0.3),
        borderRadius: BorderRadius.circular(8.0.px),
        border: Border.all(
          color: appColors.borderColor.withOpacity(0.3),
        ),
      ),
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.px, vertical: 0.px),
        child: Center(
          child: Row(
            children: [
              Expanded(
                child: CommonDropDown(
                  itemsList: itemsList,
                  onChanged: onChanged,
                  textSize: 16.px,
                  dropdownValue: dropdownValue,
                  iconSize: 10.0.px,
                  isExpanded: true,
                  underline: Container(),
                  icon: Image.asset(
                    ImagePath.downArrow,
                    height: 16.0.px,
                    width: 16.0.px,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class CommonCheckBox extends StatelessWidget {
  String title;
  String? image;
  bool isSelection;
  GestureTapCallback? onTap;

  CommonCheckBox({
    Key? key,
    this.title = "",
    this.image,
    this.onTap,
    this.isSelection = false,
  }) : super(key: key);

  AppColors appColors = AppColors();

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 55.px,
        margin: EdgeInsets.only(top: 20.px),
        padding: EdgeInsets.symmetric(horizontal: 20.px),
        decoration: BoxDecoration(
          color: appColors.borderColor.withOpacity(0.3),
          borderRadius: BorderRadius.circular(8.0.px),
          border: Border.all(
            color: appColors.borderColor.withOpacity(0.3),
          ),
        ),
        child: Row(
          children: [
            Expanded(
              child: MyTextView(
                title,
                isMaxLineWrap: true,
                textAlignNew: TextAlign.start,
                textStyleNew: MyTextStyle(
                  textSize: 16.sp,
                  textColor: appColors.appText,
                  textWeight: FontWeight.normal,
                ),
              ),
            ),
            Image.asset(
              isSelection ? image ?? ImagePath.check : ImagePath.unCheckRing,
              width: 7.w,
              height: 7.w,
            )
          ],
        ),
      ),
    );
  }
}

/*class CommonImageContainer extends StatelessWidget {
  final String? imageName;
  final double? height;
  final bool? isCircle;
  final double? radius;

  const CommonImageContainer({
    Key? key,
    this.imageName,
    this.height,
    this.isCircle = true,
    this.radius = 10,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    AppColors appColors = AppColors();
    return Container(
      height: ResponsiveFlutter.of(context).hp(height ?? 15),
      width: ResponsiveFlutter.of(context).hp(height ?? 15),
      decoration: BoxDecoration(
        color: appColors.white,
        borderRadius: isCircle!
            ? BorderRadius.circular(
                ResponsiveFlutter.of(context).hp((height ?? 15) / 2),
              )
            : BorderRadius.circular(
                ResponsiveFlutter.of(context).moderateScale(radius!),
              ),
        boxShadow: [
          BoxShadow(
            color: appColors.buttonBackGroundColor.withOpacity(0.09),
            spreadRadius: 4,
            blurRadius: 10,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: Center(
        child: Image.asset(
          imageName ?? ImagePath.signIn,
          height: ResponsiveFlutter.of(context).hp((height ?? 15) / 2),
          width: ResponsiveFlutter.of(context).hp((height ?? 15) / 2),
        ),
      ),
    );
  }
}*/

/*class CommonMainContainer extends StatelessWidget {
  final Widget? child;

  const CommonMainContainer({
    Key? key,
    this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    AppColors appColors = AppColors();
    return GestureDetector(
      onTap: () {
        FocusScopeNode currentFocus = FocusScope.of(context);
        if (!currentFocus.hasPrimaryFocus) {
          currentFocus.unfocus();
        }
      },
      child: Scaffold(
        backgroundColor: appColors.white,
        body: SafeArea(
          bottom: false,
          top: false,
          child: child ?? Container(),
        ),
      ),
    );
  }
}*/

/*class CommonDateTimeShow extends StatelessWidget {
  final String? datetime;
  final String? image;
  final bool? isExpand;

  const CommonDateTimeShow({
    Key? key,
    this.datetime,
    this.image,
    this.isExpand = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    AppColors appColors = AppColors();
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Image.asset(
          image ?? ImagePath.date,
          height: ResponsiveFlutter.of(context).verticalScale(12),
          width: ResponsiveFlutter.of(context).verticalScale(12),
        ),
        SizedBox(width: ResponsiveFlutter.of(context).moderateScale(8)),
        isExpand!
            ? Expanded(
                child: MyTextView(
                  datetime ?? "23 June, 2022",
                  textStyleNew: MyTextStyle(
                    textColor: appColors.buttonBackGroundColor.withOpacity(0.8),
                    textWeight: FontWeight.w400,
                    textSize: ResponsiveFlutter.of(context).fontSize(1.8),
                  ),
                ),
              )
            : MyTextView(
                datetime ?? "23 June, 2022",
                textStyleNew: MyTextStyle(
                  textColor: appColors.buttonBackGroundColor.withOpacity(0.8),
                  textWeight: FontWeight.w400,
                  textSize: ResponsiveFlutter.of(context).fontSize(1.8),
                ),
              ),
      ],
    );
  }
}*/

/*class CommonGridView extends StatelessWidget {
  final int itemCount;
  final IndexedWidgetBuilder itemBuilder;

  const CommonGridView({
    Key? key,
    required this.itemCount,
    required this.itemBuilder,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      physics: const ClampingScrollPhysics(),
      padding: EdgeInsets.only(
        top: ResponsiveFlutter.of(context).moderateScale(10),
        left: ResponsiveFlutter.of(context).moderateScale(15),
        right: ResponsiveFlutter.of(context).moderateScale(15),
        bottom: ResponsiveFlutter.of(context).moderateScale(20),
      ),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisSpacing: ResponsiveFlutter.of(context).moderateScale(15),
        mainAxisSpacing: ResponsiveFlutter.of(context).moderateScale(15),
        crossAxisCount: 2,
      ),
      itemCount: itemCount,
      itemBuilder: itemBuilder,
    );
  }
}*/

/*class CommonHomeGridViewContainer extends StatelessWidget {
  final String image;
  final String title;
  final int? countBudge;
  final GestureTapCallback? onTap;

  const CommonHomeGridViewContainer({
    Key? key,
    required this.image,
    required this.title,
    this.onTap,
    this.countBudge,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    AppColors appColors = AppColors();
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          color: appColors.white,
          borderRadius: BorderRadius.circular(
            ResponsiveFlutter.of(context).moderateScale(10),
          ),
          border: Border.all(color: appColors.themeColor),
          boxShadow: [
            BoxShadow(
              color: appColors.buttonBackGroundColor.withOpacity(0.09),
              spreadRadius: 4,
              blurRadius: 10,
              offset: const Offset(0, 3),
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Stack(
              children: [
                Container(
                  height: ResponsiveFlutter.of(context).wp(20),
                  width: ResponsiveFlutter.of(context).wp(20),
                  decoration: BoxDecoration(
                    color: appColors.white,
                    shape: BoxShape.circle,
                    border: Border.all(color: appColors.themeColor),
                    boxShadow: [
                      BoxShadow(
                        color: appColors.buttonBackGroundColor.withOpacity(0.09),
                        spreadRadius: 4,
                        blurRadius: 10,
                        offset: const Offset(0, 3),
                      ),
                    ],
                  ),
                  child: Stack(
                    children: [
                      Positioned(
                        right: ResponsiveFlutter.of(context).moderateScale(10),
                        top: ResponsiveFlutter.of(context).moderateScale(10),
                        child: Container(
                          height: ResponsiveFlutter.of(context).wp(8),
                          width: ResponsiveFlutter.of(context).wp(8),
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: appColors.themeColor.withOpacity(0.1),
                          ),
                        ),
                      ),
                      Center(
                        child: Image.asset(
                          image,
                          height: ResponsiveFlutter.of(context).wp(9),
                          width: ResponsiveFlutter.of(context).wp(9),
                        ),
                      ),
                    ],
                  ),
                ),
                Visibility(
                  visible: countBudge != null && countBudge != 0,
                  child: Positioned(
                    right: ResponsiveFlutter.of(context).moderateScale(0),
                    top: ResponsiveFlutter.of(context).moderateScale(0),
                    child: Container(
                      height: ResponsiveFlutter.of(context).wp(7),
                      width: ResponsiveFlutter.of(context).wp(7),
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: appColors.budgeColor,
                      ),
                      child: FittedBox(
                        child: Padding(
                          padding: EdgeInsets.all(ResponsiveFlutter.of(context).moderateScale(3)),
                          child: CommonMediumText(title: countBudge.toString(), textSize: 1.5, textColor: appColors.white),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: ResponsiveFlutter.of(context).verticalScale(10)),
            MyTextView(
              title,
              textAlignNew: TextAlign.center,
              textStyleNew: MyTextStyle(
                textColor: appColors.buttonBackGroundColor,
                textSize: ResponsiveFlutter.of(context).fontSize(2.3),
                textWeight: FontWeight.w600,
              ),
              maxLinesNew: 2,
            ),
          ],
        ),
      ),
    );
  }
}*/

/*class CommonChatDateCell extends StatelessWidget {
  final String? datetime;

  const CommonChatDateCell({
    Key? key,
    this.datetime,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    AppColors appColors = AppColors();
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Expanded(
          child: Container(
            height: ResponsiveFlutter.of(context).verticalScale(1),
            color: appColors.buttonBackGroundColor.withOpacity(0.2),
          ),
        ),
        Padding(
          padding: EdgeInsets.all(ResponsiveFlutter.of(context).moderateScale(10)),
          child: MyTextView(
            datetime ?? "Today",
            textStyleNew: MyTextStyle(
              textColor: appColors.buttonBackGroundColor,
              textWeight: FontWeight.w600,
              textSize: ResponsiveFlutter.of(context).fontSize(2.5),
            ),
          ),
        ),
        Expanded(
          child: Container(
            height: ResponsiveFlutter.of(context).verticalScale(1),
            color: appColors.buttonBackGroundColor.withOpacity(0.2),
          ),
        ),
      ],
    );
  }
}*/

/*class CommonChatReceiverCell extends StatelessWidget {
  final MessageList? obj;
  final String? time;

  const CommonChatReceiverCell({
    Key? key,
    this.obj,
    this.time,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    AppColors appColors = AppColors();
    return Container(
      padding: EdgeInsets.only(left: ResponsiveFlutter.of(context).moderateScale(10)),
      child: Align(
        alignment: (Alignment.topRight),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(
              decoration: BoxDecoration(
                color: appColors.white,
                shape: BoxShape.circle,
                border: Border.all(color: appColors.themeColor),
                boxShadow: [
                  BoxShadow(
                    color: appColors.buttonBackGroundColor.withOpacity(0.09),
                    spreadRadius: 4,
                    blurRadius: 10,
                    offset: const Offset(0, 3),
                  ),
                ],
              ),
              child: ClipOval(
                child: CachedNetworkImage(
                  imageUrl: obj!.profile ?? '',
                  errorWidget: (context, url, error) => CommonImageContainer(
                    imageName: ImagePath.mentorProfile,
                    height: 4.5,
                  ),
                  placeholder: (context, url) => CommonImageContainer(
                    imageName: ImagePath.mentorProfile,
                    height: 4.5,
                  ),
                  height: ResponsiveFlutter.of(context).wp(9),
                  width: ResponsiveFlutter.of(context).wp(9),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            SizedBox(width: ResponsiveFlutter.of(context).moderateScale(10)),
            Flexible(
              child: Container(
                margin: EdgeInsets.only(right: ResponsiveFlutter.of(context).wp(15)),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(ResponsiveFlutter.of(context).moderateScale(10)),
                  color: appColors.receiverBackColor,
                ),
                padding: EdgeInsets.all(ResponsiveFlutter.of(context).moderateScale(10)),
                child: Wrap(
                  direction: Axis.horizontal,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        CommonMediumText(title: obj?.username ?? '', textSize: 1.6),
                        SizedBox(height: ResponsiveFlutter.of(context).moderateScale(5)),
                        MyTextView(
                          obj!.msg,
                          isMaxLineWrap: true,
                          overflowText: TextOverflow.ellipsis,
                          textStyleNew: MyTextStyle(
                            textColor: appColors.buttonBackGroundColor,
                            textWeight: FontWeight.w400,
                            textSize: ResponsiveFlutter.of(context).fontSize(1.7),
                          ),
                        ),
                        SizedBox(height: ResponsiveFlutter.of(context).moderateScale(5)),
                        CommonMediumText(title: time, textSize: 1.2),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}*/

/*class CommonChatSenderCell extends StatelessWidget {
  final MessageList? obj;
  final String? time;

  const CommonChatSenderCell({
    Key? key,
    this.obj,
    this.time,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    AppColors appColors = AppColors();
    return Container(
      padding: EdgeInsets.only(left: ResponsiveFlutter.of(context).moderateScale(10)),
      child: Align(
        alignment: (Alignment.topRight),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Flexible(
              child: Container(
                margin: EdgeInsets.only(left: ResponsiveFlutter.of(context).wp(15)),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(ResponsiveFlutter.of(context).moderateScale(10)),
                  color: appColors.buttonBackGroundColor.withOpacity(0.05),
                ),
                padding: EdgeInsets.all(ResponsiveFlutter.of(context).moderateScale(10)),
                child: Wrap(
                  direction: Axis.horizontal,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        MyTextView(
                          obj!.msg,
                          isMaxLineWrap: true,
                          overflowText: TextOverflow.ellipsis,
                          textStyleNew: MyTextStyle(
                            textColor: appColors.buttonBackGroundColor,
                            textWeight: FontWeight.w400,
                            textSize: ResponsiveFlutter.of(context).fontSize(1.7),
                          ),
                        ),
                        SizedBox(height: ResponsiveFlutter.of(context).moderateScale(5)),
                        CommonMediumText(title: time, textSize: 1.2),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(width: ResponsiveFlutter.of(context).moderateScale(10)),
            Container(
              decoration: BoxDecoration(
                color: appColors.white,
                shape: BoxShape.circle,
                border: Border.all(color: appColors.themeColor),
                boxShadow: [
                  BoxShadow(
                    color: appColors.buttonBackGroundColor.withOpacity(0.09),
                    spreadRadius: 4,
                    blurRadius: 10,
                    offset: const Offset(0, 3),
                  ),
                ],
              ),
              child: ClipOval(
                child: CachedNetworkImage(
                  imageUrl: obj!.profile ?? '',
                  errorWidget: (context, url, error) => CommonImageContainer(
                    imageName: ImagePath.mentorProfile,
                    height: 4.5,
                  ),
                  placeholder: (context, url) => CommonImageContainer(
                    imageName: ImagePath.mentorProfile,
                    height: 4.5,
                  ),
                  height: ResponsiveFlutter.of(context).wp(9),
                  width: ResponsiveFlutter.of(context).wp(9),
                  fit: BoxFit.cover,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}*/

/*class CommonCommentCell extends StatelessWidget {
  final TopicComments? obj;

  const CommonCommentCell({
    Key? key,
    this.obj,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    AppColors appColors = AppColors();
    return Padding(
      padding: EdgeInsets.only(left: ResponsiveFlutter.of(context).wp(8)),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            decoration: BoxDecoration(
              color: appColors.white,
              shape: BoxShape.circle,
              border: Border.all(color: appColors.themeColor),
              boxShadow: [
                BoxShadow(
                  color: appColors.buttonBackGroundColor.withOpacity(0.09),
                  spreadRadius: 4,
                  blurRadius: 10,
                  offset: const Offset(0, 3),
                ),
              ],
            ),
            child: ClipOval(
              child: CachedNetworkImage(
                imageUrl: obj?.userDetail?.profile ?? '',
                errorWidget: (context, url, error) => CommonImageContainer(
                  imageName: ImagePath.mentorProfile,
                  height: 4,
                ),
                placeholder: (context, url) => CommonImageContainer(
                  imageName: ImagePath.mentorProfile,
                  height: 4,
                ),
                height: ResponsiveFlutter.of(context).hp(4),
                width: ResponsiveFlutter.of(context).hp(4),
                fit: BoxFit.cover,
              ),
            ),
          ),
          SizedBox(width: ResponsiveFlutter.of(context).moderateScale(10)),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    MyTextView(
                      obj?.userDetail?.username ?? "",
                      textAlignNew: TextAlign.center,
                      textStyleNew: MyTextStyle(
                        textColor: appColors.buttonBackGroundColor,
                        textSize: ResponsiveFlutter.of(context).fontSize(1.6),
                        textWeight: FontWeight.w600,
                      ),
                      maxLinesNew: 2,
                    ),
                    SizedBox(width: ResponsiveFlutter.of(context).moderateScale(5)),
                    MyTextView(
                      Utils().timeAgoSinceDate(obj?.createdAt ?? ''),
                      textAlignNew: TextAlign.center,
                      textStyleNew: MyTextStyle(
                        textColor: appColors.buttonBackGroundColor.withOpacity(0.6),
                        textSize: ResponsiveFlutter.of(context).fontSize(1.4),
                        textWeight: FontWeight.w600,
                      ),
                      maxLinesNew: 2,
                    ),
                  ],
                ),
                SizedBox(height: ResponsiveFlutter.of(context).moderateScale(2)),
                MyTextView(
                  obj?.commentText ?? '',
                  textStyleNew: MyTextStyle(
                    textColor: appColors.buttonBackGroundColor,
                    textWeight: FontWeight.w400,
                    textSize: ResponsiveFlutter.of(context).fontSize(1.7),
                  ),
                  isMaxLineWrap: true,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}*/

class CommonBackArrow extends StatelessWidget {
  final GestureTapCallback? backArrowTap;
  final bool isBack;
  final bool isTitle;
  final bool centerTitle;
  final bool isTitleSpace;
  final String title;

  const CommonBackArrow({
    Key? key,
    this.backArrowTap,
    this.isBack = true,
    this.isTitle = false,
    this.centerTitle = false,
    this.isTitleSpace = true,
    this.title = "",
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    AppColors appColors = AppColors();
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(height: 3.h),
        isBack
            ? Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  GestureDetector(
                    onTap: backArrowTap,
                    child: Container(
                      width: 41.px,
                      height: 41.px,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(2.w),
                        color: appColors.grey.withOpacity(0.1),
                      ),
                      child: Padding(
                        padding: EdgeInsets.all(3.w),
                        child: Image.asset(ImagePath.backArrow),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 25.px,
                  ),
                ],
              )
            : const SizedBox(),
        (!isBack && isTitle)
            ? SizedBox(
                height: 2.h,
              )
            : const SizedBox(),
        if (isTitle)
          Column(
            children: [
              Container(
                width: double.infinity,
                alignment: centerTitle ? Alignment.center : Alignment.topLeft,
                child: MyTextView(
                  title,
                  isMaxLineWrap: true,
                  textStyleNew: MyTextStyle(
                    textFamily: AppFontFamily.GothamRoundedMedium,
                    textSize: AppDimensions().headerFontSize,
                    textColor: AppColors().appText,
                    textWeight: FontWeight.w500,
                  ),
                ),
              ),
              if (isTitleSpace) SizedBox(height: 2.h),
            ],
          )
      ],
    );
  }
}
