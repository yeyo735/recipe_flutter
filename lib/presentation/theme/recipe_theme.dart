import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'cupertino_theme.dart';
import 'material_theme.dart';

/// Global theme provider that applies platform-specific themes.
class RecipeTheme {
  /// Returns the appropriate theme based on platform and dark mode setting.
  static ThemeData  getMaterialTheme(Brightness brightness) {
    return materialTheme(brightness);
  }

  /// Returns the Cupertino theme for iOS/macOS.
  static CupertinoThemeData getCupertinoTheme(Brightness brightness) {
    return cupertinoTheme(brightness);
  }
}
