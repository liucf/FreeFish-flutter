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

class AppRadius {
  static double get button => 6;

  static double get buttonTextFilled => 3;

  static double get card => 10;

  static double get sheet => 20;

  static double get input => 5;

  static double get image => 6;
}
