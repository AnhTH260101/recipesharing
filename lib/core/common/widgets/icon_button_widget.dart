import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:recipesharing/core/extensions/context.dart';

import '../../utils/constants.dart';

class IconButtonWidget extends StatelessWidget {
  final String label;
  final VoidCallback onPressed;
  final Color color;
  final double width;
  final double height;
  final double borderRadius;
  final double paddingTop;
  final double paddingBottom;
  final double paddingLeft;
  final double paddingRight;
  final double paddingAll;
  final double paddingHorizontal;
  final double paddingVertical;
  final Widget? icon;

  const IconButtonWidget({
    Key? key,
    required this.label,
    required this.onPressed,
    this.color = Colors.white,
    this.width = 40.0,
    this.height = 40.0,
    this.borderRadius = 6.0,
    this.paddingTop = 0.0,
    this.paddingBottom = 0.0,
    this.paddingLeft = 0.0,
    this.paddingRight = 0.0,
    this.paddingAll = 0.0,
    this.paddingHorizontal = 0.0,
    this.paddingVertical = 0.0,
    this.icon,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: paddingAll != 0.0
          ? EdgeInsets.all(paddingAll)
          : ((paddingHorizontal != 0.0 || paddingVertical != 0.0)
              ? EdgeInsets.symmetric(
                  horizontal: paddingHorizontal, vertical: paddingVertical)
              : EdgeInsets.only(
                  left: paddingLeft,
                  right: paddingRight,
                  top: paddingTop,
                  bottom: paddingBottom)),
      child: Container(
        width: width.w,
        height: height.w,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(borderRadius.r),
          color: color,
        ),
        child: Material(
          color: Colors.transparent,
          child: InkWell(
            onTap: onPressed,
            borderRadius: BorderRadius.circular(borderRadius),
            child: Center(
              child: icon ?? SizedBox.shrink(),
            ),
          ),
        ),
      ),
    );
  }
}
