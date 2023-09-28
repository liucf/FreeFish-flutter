import 'package:flutter/material.dart';

ThemeData darkTheme = ThemeData(
  brightness: Brightness.dark,
  colorScheme: const ColorScheme.dark(
    primary: Colors.white,
    onPrimary: Colors.black,
    secondary: Colors.white,
    onSecondary: Colors.black,
    surface: Colors.white,
    onSurface: Colors.black,
    background: Colors.black,
    onBackground: Colors.white,
    error: Colors.red,
    onError: Colors.white,
  ),
);
