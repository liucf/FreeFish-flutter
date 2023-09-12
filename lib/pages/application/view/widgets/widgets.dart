import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:freefish/common/utils/app_colors.dart';
import 'package:freefish/common/utils/app_image_res.dart';
import 'package:freefish/common/widgets/image_widgets.dart';
import 'package:freefish/pages/home/view/home.dart';

var bottomItems = <BottomNavigationBarItem>[
  BottomNavigationBarItem(
    icon: _bottomContainer(),
    activeIcon: _bottomContainer(color: AppColors.primaryElement),
    backgroundColor: AppColors.primaryBackground,
    label: "Home",
  ),
  BottomNavigationBarItem(
    icon: _bottomContainer(imagePath: AppImageRes.search),
    activeIcon: _bottomContainer(
      imagePath: AppImageRes.search,
      color: AppColors.primaryElement,
    ),
    backgroundColor: AppColors.primaryBackground,
    label: "Search",
  ),
  BottomNavigationBarItem(
    icon: _bottomContainer(imagePath: AppImageRes.message),
    activeIcon: _bottomContainer(
      imagePath: AppImageRes.message,
      color: AppColors.primaryElement,
    ),
    backgroundColor: AppColors.primaryBackground,
    label: "Message",
  ),
  BottomNavigationBarItem(
    icon: _bottomContainer(imagePath: AppImageRes.person),
    activeIcon: _bottomContainer(
      imagePath: AppImageRes.person,
      color: AppColors.primaryElement,
    ),
    backgroundColor: AppColors.primaryBackground,
    label: "Profile",
  ),
];

Widget _bottomContainer({
  double width = 15,
  double height = 15,
  String imagePath = AppImageRes.home,
  Color color = AppColors.primaryFourElementText,
}) {
  return SizedBox(
    width: width.w,
    height: height.h,
    child: appImageWithColor(
      imagePath: imagePath,
      color: color,
    ),
  );
}

Widget appScreens(int index) {
  List<Widget> screens = [
    const Home(),
    const Center(
      child: Text("Search"),
    ),
    const Center(
      child: Text("Message"),
    ),
    const Center(
      child: Text("Profile"),
    ),
  ];
  return screens[index];
}
