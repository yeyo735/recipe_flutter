import 'package:flutter/material.dart';

class AppTypography {
  static const TextTheme textTheme = TextTheme(
    displayLarge: TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
    titleLarge: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
    bodyLarge: TextStyle(fontSize: 16, fontWeight: FontWeight.normal),
  );

  static const TextStyle baseTextStyle = TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.normal,
    color: Colors.black,
  );
}