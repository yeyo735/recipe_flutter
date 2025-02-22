import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:recipe_flutter/presentation/widgets/recipe_list.dart';
import '../widgets/topbar.dart';

class RecipeHomeScreen extends ConsumerWidget {
  final Function(String) onRecipeSelected;

  const RecipeHomeScreen({super.key, required this.onRecipeSelected});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: const TopBar(title: "Recipes"),
      body: RecipeList(onRecipeSelected: onRecipeSelected),
    );
  }
}
