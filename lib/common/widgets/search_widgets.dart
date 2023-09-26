import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:freefish/common/utils/app_colors.dart';
import 'package:freefish/common/widgets/app_shadow.dart';
import 'package:freefish/common/widgets/app_textfields.dart';

Widget searchBar({required WidgetRef ref}) {
  TextEditingController searchController = TextEditingController();

  return Row(
    crossAxisAlignment: CrossAxisAlignment.center,
    children: [
      Container(
        width: 280.w,
        height: 40.h,
        decoration: appBoxShadow(
            color: AppColors.primaryBackground,
            border: Border.all(color: AppColors.primaryFourElementText)),
        child: Row(
          children: [
            SizedBox(
              width: 10.w,
            ),
            const Icon(
              Icons.search,
              color: AppColors.primaryFourElementText,
            ),
            appTextFieldOnly(
              controller: searchController,
              width: 220,
              height: 35,
              hint: "Search",
              showBorder: false,
            )
          ],
        ),
      ),
      GestureDetector(
        onTap: () {
          Navigator.of(ref.context)
              .pushNamed('search', arguments: searchController.text);
        },
        child: Container(
          margin: EdgeInsets.only(left: 10.w),
          width: 35.w,
          height: 35.h,
          decoration: appBoxShadow(
            color: AppColors.primaryBackground,
            border: Border.all(color: AppColors.primaryFourElementText),
            radius: 8,
          ),
          child: const Icon(
            Icons.filter_list,
            color: AppColors.primaryFourElementText,
          ),
        ),
      )
    ],
  );
}
