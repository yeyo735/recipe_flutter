import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../domain/entities/recipe.dart';
import '../../domain/entities/recipe_detail.dart';
import '../screens/recipe_detail_screen.dart';
import '../screens/recipe_map_screen.dart';
import '../widgets/topbar.dart';

class RecipeDetailTabScreen extends ConsumerWidget {
  final Recipe recipe;
  final RecipeDetail recipeDetail;

  const RecipeDetailTabScreen({
    super.key,
    required this.recipe,
    required this.recipeDetail,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: const TopBar(title: "Recipe Details", showBackButton: true),
        body: Column(
          children: [
            const TabBar(
              labelColor: Colors.black,
              indicatorColor: Colors.blue,
              tabs: [
                Tab(text: "Details"),
                Tab(text: "Map"),
              ],
            ),
            Expanded(
              child: TabBarView(
                children: [
                  RecipeDetailScreen(recipe: recipe, recipeDetail: recipeDetail),
                  RecipeMapScreen(recipe: recipe),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
