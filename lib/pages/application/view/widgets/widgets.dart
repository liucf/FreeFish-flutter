import 'package:flutter/material.dart';
import 'package:freefish/common/utils/app_colors.dart';
import 'package:freefish/pages/category/view/category.dart';
import 'package:freefish/pages/home/view/home.dart';
import 'package:freefish/pages/my/view/my.dart';

var bottomItems = <BottomNavigationBarItem>[
  const BottomNavigationBarItem(
    icon: Icon(Icons.home),
    activeIcon: Icon(
      Icons.home,
      color: AppColors.primaryElement,
    ),
    backgroundColor: AppColors.primaryBackground,
    label: "Home",
  ),
  const BottomNavigationBarItem(
    icon: Icon(Icons.category),
    activeIcon: Icon(
      Icons.category,
      color: AppColors.primaryElement,
    ),
    backgroundColor: AppColors.primaryBackground,
    label: "Category",
  ),
  const BottomNavigationBarItem(
    icon: Icon(Icons.sell),
    activeIcon: Icon(
      Icons.sell,
      color: AppColors.primaryElement,
    ),
    backgroundColor: AppColors.primaryBackground,
    label: "Sell",
  ),
  const BottomNavigationBarItem(
    icon: Icon(Icons.person),
    activeIcon: Icon(
      Icons.person,
      color: AppColors.primaryElement,
    ),
    backgroundColor: AppColors.primaryBackground,
    label: "Profile",
  ),
];

// Widget _bottomContainer({
//   double width = 15,
//   double height = 15,
//   String imagePath = AppImageRes.home,
//   Color color = AppColors.primaryFourElementText,
// }) {
//   return SizedBox(
//     width: width.w,
//     height: height.h,
//     child: appImageWithColor(
//       imagePath: imagePath,
//       color: color,
//     ),
//   );
// }

Widget appScreens(int index) {
  List<Widget> screens = [
    const Home(),
    const Category(),
    const Center(
      child: Text("Message"),
    ),
    const My(),
  ];
  return screens[index];
}
