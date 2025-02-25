import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'dart:io';

class RecipeTheme {
  static ThemeData get lightTheme {
    return ThemeData(
      useMaterial3: true,
      brightness: Brightness.light,
      colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
      appBarTheme: const AppBarTheme(
        backgroundColor: Colors.blue,
        titleTextStyle: TextStyle(color: Colors.white, fontSize: 20),
      ),
    );
  }

  static ThemeData get darkTheme {
    return ThemeData(
      useMaterial3: true,
      brightness: Brightness.dark,
      colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue, brightness: Brightness.dark),
    );
  }

  static CupertinoThemeData get cupertinoTheme {
    return const CupertinoThemeData(
      brightness: Brightness.light,
      primaryColor: CupertinoColors.activeBlue,
    );
  }

  static ThemeData get platformTheme {
    if (Platform.isIOS || Platform.isMacOS) {
      return ThemeData(
        cupertinoOverrideTheme: cupertinoTheme,
      );
    } else {
      return lightTheme;
    }
  }
}
