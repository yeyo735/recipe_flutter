import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart'; // For kIsWeb
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:recipe_flutter/presentation/screens/recipe_app.dart';
import 'package:recipe_flutter/presentation/theme/recipe_theme.dart';

void main() {
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    bool isCupertino = false;
    // Only check Platform for mobile/desktop (not web)
    if (!kIsWeb) {
      // Use platform-specific checks for mobile/desktop platforms
      isCupertino = (defaultTargetPlatform == TargetPlatform.iOS);
    }
    if (!isCupertino) {
      return MaterialApp(
        title: 'Recipe App',
        debugShowCheckedModeBanner: false,
        themeMode: ThemeMode.system,
        theme: RecipeTheme.getMaterialTheme(Brightness.light),
        darkTheme: RecipeTheme.getMaterialTheme(Brightness.dark),
        home: const RecipeApp(),
      );
    } else {
      return CupertinoApp(
        title: 'Recipe App',
        debugShowCheckedModeBanner: false,
        theme: RecipeTheme.getCupertinoTheme(
          ThemeMode.system == ThemeMode.light
              ? Brightness.light
              : Brightness.dark,
        ),
        home: const RecipeApp(),
      );
    }
  }
}
