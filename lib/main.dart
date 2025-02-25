import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:recipe_flutter/presentation/options/recipe_theme.dart';
import 'package:recipe_flutter/presentation/screens/recipe_app.dart';

void main() {
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Recipe App',
      debugShowCheckedModeBanner: false,
      theme: RecipeTheme.lightTheme,
      darkTheme: RecipeTheme.darkTheme,
      themeMode: ThemeMode.system,
      home: const RecipeApp(),
    );
  }
}
