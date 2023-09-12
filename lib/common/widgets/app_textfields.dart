import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:freefish/common/utils/app_colors.dart';
import 'package:freefish/common/widgets/app_shadow.dart';
import 'package:freefish/common/widgets/image_widgets.dart';
import 'package:freefish/common/widgets/text_widgets.dart';

Widget appTextField(
  String s, {
  TextEditingController? controller,
  String iconPath = "assets/icons/person.png",
  String hint = "Type in your info",
  bool obscureText = false,
  Function(String value)? func,
}) {
  return Container(
    margin: EdgeInsets.only(top: 20.h),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        text14Normal(text: s),
        Container(
          margin: EdgeInsets.only(top: 5.h),
          height: 50.h,
          decoration: appBoxDecorationTextField(radius: 8),
          child: Row(
            children: [
              Container(
                margin: EdgeInsets.only(left: 17.w, right: 10.w),
                child: appImage(imagePath: iconPath),
              ),
              SizedBox(
                width: 270.w,
                height: 50.h,
                child: TextField(
                  onChanged: (value) => func!(value),
                  controller: controller,
                  keyboardType: TextInputType.multiline,
                  decoration: InputDecoration(
                    hintText: hint,
                    hintStyle: const TextStyle(
                      color: AppColors.primaryThreeElementText,
                      fontSize: 14,
                    ),
                    border: InputBorder.none,
                  ),
                  maxLines: 1,
                  autocorrect: false,
                  obscureText: obscureText,
                ),
              )
            ],
          ),
        ),
      ],
    ),
  );
}

Widget appTextFieldOnly({
  TextEditingController? controller,
  String hint = "Type in your info",
  double width = 270,
  double height = 50,
  bool obscureText = false,
  Function(String value)? func,
}) {
  return SizedBox(
    width: width.w,
    height: height.h,
    child: TextField(
      onChanged: (value) => func!(value),
      controller: controller,
      keyboardType: TextInputType.multiline,
      decoration: InputDecoration(
        hintText: hint,
        hintStyle: const TextStyle(
          color: AppColors.primaryThreeElementText,
          fontSize: 14,
        ),
        border: InputBorder.none,
      ),
      maxLines: 1,
      autocorrect: false,
      obscureText: obscureText,
    ),
  );
}
