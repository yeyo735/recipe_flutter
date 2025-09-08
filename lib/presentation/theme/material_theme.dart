import 'package:flutter/material.dart';
import 'package:recipe_flutter/presentation/theme/typography.dart';

import 'colors.dart';

ThemeData materialTheme(Brightness brightness) {
  var lightTheme = ThemeData(
    brightness: brightness,
    primaryColor: AppColors.lightPrimary,
    hintColor: AppColors.lightAccent,
    scaffoldBackgroundColor: Colors.white,
    appBarTheme: AppBarTheme(
      backgroundColor: AppColors.lightBackground,
      elevation: 0,
      iconTheme: IconThemeData(color: AppColors.darkAccent),
    ),
    textTheme: AppTypography.textTheme,
    inputDecorationTheme: InputDecorationTheme(
      border: OutlineInputBorder(
        borderSide: BorderSide(
          color: Colors.grey[300]!,
        ),
      ),
      focusedBorder: OutlineInputBorder(
        borderSide: BorderSide(
          color: AppColors.lightPrimary,
        ),
      ),
    ),
  );
  var darkTheme = ThemeData(
    brightness: brightness,
    colorScheme: ColorScheme.fromSeed(
      seedColor: AppColors.darkPrimary,
      brightness: brightness,
    ),
    textTheme: AppTypography.textTheme,
    useMaterial3: true,
  );;
  return brightness== Brightness.light ? lightTheme : darkTheme;
}
