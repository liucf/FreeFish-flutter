import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:freefish/common/utils/app_colors.dart';
import 'package:freefish/common/utils/app_image_res.dart';

Widget appImage({
  String imagePath = AppImageRes.user,
  double width = 16,
  double height = 16,
}) {
  return Image.asset(
    imagePath,
    width: width.w,
    height: height.h,
  );
}

Widget appImageWithColor(
    {String imagePath = AppImageRes.user,
    double width = 16,
    double height = 16,
    Color color = AppColors.primaryElement}) {
  return Image.asset(
    imagePath,
    width: width.w,
    height: height.h,
    color: color,
  );
}
