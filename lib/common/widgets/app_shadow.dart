import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:freefish/common/utils/app_colors.dart';

BoxDecoration appBoxShadow({
  Color color = AppColors.primaryElement,
  double radius = 15,
  double blur = 4,
  double spread = 1,
  BoxBorder? border,
}) {
  return BoxDecoration(
    color: color,
    borderRadius: BorderRadius.circular(radius),
    border: border,
    boxShadow: [
      BoxShadow(
        color: color.withOpacity(0.5),
        spreadRadius: spread,
        blurRadius: blur,
        offset: const Offset(0, 3),
      ),
    ],
  );
}

BoxDecoration appBoxDecorationTextField({
  Color color = AppColors.primaryBackground,
  double radius = 15,
  Color borderColor = AppColors.primaryFourElementText,
}) {
  return BoxDecoration(
    color: color,
    borderRadius: BorderRadius.circular(radius),
    border: Border.all(
      color: borderColor.withOpacity(0.5),
    ),
  );
}

BoxDecoration appBoxShadowWithRadius({
  Color color = AppColors.primaryThreeElementText,
  double radius = 20,
  double blur = 4,
  double spread = 1,
  BoxBorder? border,
}) {
  return BoxDecoration(
    color: color,
    borderRadius: BorderRadius.only(
      topLeft: Radius.circular(radius.h),
      topRight: Radius.circular(radius.h),
    ),
    border: border,
    boxShadow: [
      BoxShadow(
        color: color.withOpacity(0.5),
        spreadRadius: spread,
        blurRadius: blur,
        offset: const Offset(0, 3),
      ),
    ],
  );
}
