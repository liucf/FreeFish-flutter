import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:freefish/common/utils/app_colors.dart';
import 'package:velocity_x/velocity_x.dart';

Widget text24Normal(
    {required String text,
    Color color = AppColors.primaryText,
    FontWeight fontWeight = FontWeight.normal}) {
  return text.text
      .color(color)
      .size(24.sp)
      .fontWeight(fontWeight)
      .center
      .make();
}

Widget text16Normal({
  required String text,
  Color color = AppColors.primarySecondaryElementText,
  FontWeight fontWeight = FontWeight.normal,
}) {
  return text.text
      .color(color)
      .size(16.sp)
      .fontWeight(fontWeight)
      .center
      .normal
      .make();
}

Widget text14Normal(
    {required String text, Color color = AppColors.primaryThreeElementText}) {
  return text.text.color(color).size(14.sp).center.normal.make();
}

Widget textUnderline(
    {required String text,
    Color color = AppColors.primarySecondaryElementText}) {
  return GestureDetector(
      onTap: () {},
      child: text.text.color(color).size(12.sp).center.normal.underline.make());
}
