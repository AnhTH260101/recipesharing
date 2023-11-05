import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:recipesharing/core/extensions/context.dart';

import '../../utils/constants.dart';

class GradientButtonWidget extends StatelessWidget {
  final String label;
  final VoidCallback onPressed;
  final List<Color> gradientColors;
  final Alignment gradientBegin;
  final Alignment gradientEnd;
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

  const GradientButtonWidget({
    Key? key,
    required this.label,
    required this.onPressed,
    this.gradientColors = const [
      Constants.primaryLightColor,
      Constants.primaryLightColor,
      Constants.primaryLightColor,
    ],
    this.gradientBegin = Alignment.topLeft,
    this.gradientEnd = Alignment.bottomRight,
    this.width = double.infinity,
    this.height = 50.0,
    this.borderRadius = 6.0,
    this.paddingTop = 0.0,
    this.paddingBottom = 0.0,
    this.paddingLeft = 0.0,
    this.paddingRight = 0.0,
    this.paddingAll = 0.0,
    this.paddingHorizontal = 0.0,
    this.paddingVertical = 0.0,
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
        width: width,
        height: height,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(borderRadius.r),
          gradient: LinearGradient(
            colors: gradientColors,
            begin: gradientBegin,
            end: gradientEnd,
          ),
        ),
        child: Material(
          color: Colors.transparent,
          child: InkWell(
            onTap: onPressed,
            borderRadius: BorderRadius.circular(borderRadius),
            child: Center(
              child: Text(
                label,
                style: context.textTheme.labelMedium,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
