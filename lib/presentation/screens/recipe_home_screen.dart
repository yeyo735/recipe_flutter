import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:recipe_flutter/presentation/widgets/recipe_list.dart';

class RecipeHomeScreen extends ConsumerWidget {
  final Function(String) onRecipeSelected;

  const RecipeHomeScreen({super.key, required this.onRecipeSelected});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(body: RecipeList(onRecipeSelected: onRecipeSelected));
  }
}
