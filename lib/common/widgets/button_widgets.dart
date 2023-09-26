import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:freefish/common/utils/app_colors.dart';
import 'package:freefish/common/widgets/app_shadow.dart';

Widget appButton({
  String text = "Sign In",
  double width = 325,
  double height = 50,
  void Function()? onPressed,
  bool inversePrimary = false,
}) {
  return GestureDetector(
    onTap: onPressed,
    child: Container(
      width: width.w,
      height: height.h,
      decoration: appBoxShadow(
          color: inversePrimary
              ? AppColors.primaryBackground
              : AppColors.primaryElement,
          border: Border.all(
            color: inversePrimary
                ? AppColors.primaryFourElementText
                : Colors.transparent,
          )),
      child: Center(
        child: Text(
          text,
          style: TextStyle(
            color: inversePrimary
                ? AppColors.primaryBg
                : AppColors.primaryBackground,
            fontSize: 16.sp,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
    ),
  );
}

Widget appButtonWithColor({
  String text = "Sign In",
  double width = 325,
  double height = 50,
  void Function()? onPressed,
  Color bgColor = AppColors.primaryElement,
  Color textColor = AppColors.primaryBackground,
}) {
  return GestureDetector(
    onTap: onPressed,
    child: Container(
      width: width.w,
      height: height.h,
      decoration: appBoxShadow(
          color: bgColor,
          border: Border.all(
            color: Colors.transparent,
          )),
      child: Center(
        child: Text(
          text,
          style: TextStyle(
            color: textColor,
            fontSize: 16.sp,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
    ),
  );
}
