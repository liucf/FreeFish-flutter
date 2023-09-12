import 'package:flutter/material.dart';
import 'package:freefish/common/utils/app_colors.dart';

class AppTheme {
  static ThemeData appThemeData = ThemeData(
    useMaterial3: true,
    brightness: Brightness.light,
    appBarTheme: const AppBarTheme(
      backgroundColor: Colors.white,
      elevation: 0,
      iconTheme: IconThemeData(color: AppColors.primarySecondaryElementText),
      titleTextStyle: TextStyle(
        color: Colors.white,
        fontSize: 28,
        fontWeight: FontWeight.w500,
      ),
    ),
  );
}


//   ThemeData(
//           colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
         
//         ),
// }