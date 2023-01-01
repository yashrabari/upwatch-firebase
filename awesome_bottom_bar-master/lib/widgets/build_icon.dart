import 'package:flutter/material.dart';

import '../count_style.dart';
import '../tab_item.dart';

class BuildIcon extends StatelessWidget {
  final TabItem item;
  final double iconSize;
  final Color iconColor;
  final CountStyle? countStyle;

  const BuildIcon({
    Key? key,
    required this.item,
    required this.iconColor,
    this.iconSize = 22,
    this.countStyle,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Widget icon = Image.asset(
      item.icon,
      height: iconSize,
      color: iconColor,
    ); /* Icon(
      item.icon,
      size: iconSize,
      color: iconColor,
    );*/
    if (item.count is Widget) {
      double sizeBadge = countStyle?.size ?? 18;

      return Stack(
        clipBehavior: Clip.none,
        children: [
          Image.asset(
            item.icon,
            height: iconSize,
            color: iconColor,
          ),
          /* Icon(
            item.icon,
            size: iconSize,
            color: iconColor,
          ),*/
          PositionedDirectional(
            start: iconSize - sizeBadge / 2,
            top: -sizeBadge / 2,
            child: item.count!,
          ),
        ],
      );
    }
    return icon;
  }
}
