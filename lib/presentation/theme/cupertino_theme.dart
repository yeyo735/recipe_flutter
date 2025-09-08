import 'package:flutter/cupertino.dart';

CupertinoThemeData cupertinoTheme(Brightness brightness) {
  var lightTheme = CupertinoThemeData(
    brightness: Brightness.light,
    primaryColor: CupertinoColors.systemIndigo.color,
    primaryContrastingColor: CupertinoColors.black,
    barBackgroundColor: CupertinoColors.white,
    scaffoldBackgroundColor: CupertinoColors.white,
    textTheme: CupertinoTextThemeData(primaryColor: CupertinoColors.black),
    applyThemeToAll: true,
  );

  var darkTheme = CupertinoThemeData(
    brightness: Brightness.dark,
    primaryColor: CupertinoColors.systemIndigo.darkColor,
    primaryContrastingColor: CupertinoColors.white,
    barBackgroundColor: CupertinoColors.black,
      scaffoldBackgroundColor: CupertinoColors.black,
    textTheme: CupertinoTextThemeData(primaryColor: CupertinoColors.white),
    applyThemeToAll: true,
  );

  return brightness == Brightness.light ? lightTheme : darkTheme;
}
