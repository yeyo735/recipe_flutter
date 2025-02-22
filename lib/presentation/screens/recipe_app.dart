import 'package:flutter/material.dart';
import 'package:flutter_adaptive_scaffold/flutter_adaptive_scaffold.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:recipe_flutter/presentation/options/nav_destination.dart';
import 'package:recipe_flutter/presentation/screens/recipe_detail_tab_screen.dart';
import 'package:recipe_flutter/presentation/screens/recipe_home_screen.dart';
import '../../di/dependencies.dart';
import '../../domain/entities/recipe.dart';
import '../../domain/entities/recipe_detail.dart';

// State providers
final selectedRecipeProvider = StateProvider<Recipe?>((ref) => null);
final selectedRecipeDetailProvider = StateProvider<RecipeDetail?>((ref) => null);
final selectedNavigationProvider = StateProvider<int>((ref) => 0);

class RecipeApp extends ConsumerWidget {
  const RecipeApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final selectedRecipe = ref.watch(selectedRecipeProvider);
    final selectedRecipeDetail = ref.watch(selectedRecipeDetailProvider);
    final selectedNavigation = ref.watch(selectedNavigationProvider);

    // Function to get the body content based on selectedNavigation
    Widget getBodyContent(int selectedNavigation, Recipe? selectedRecipe,
        RecipeDetail? selectedRecipeDetail, WidgetRef ref) {
      switch (selectedNavigation) {
        case 0:
          return RecipeHomeScreen(
            onRecipeSelected: (recipeId) async {
              final recipes = await ref.read(getRecipesUseCaseProvider)();
              final recipe = recipes.firstWhere((element) => element.id == recipeId);
              final recipeDetail = await ref.read(getRecipeDetailUseCaseProvider)(recipeId);
              ref.read(selectedRecipeProvider.notifier).state = recipe;
              ref.read(selectedRecipeDetailProvider.notifier).state = recipeDetail;
            },
          );
        case 1:
          return const Center(child: Text("Home Screen"));
        default:
          return const Center(child: Text("Unknown Screen"));
      }
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text("Recipe App"),
      ),
      body: AdaptiveScaffold(
        transitionDuration: const Duration(milliseconds: 300),
        smallBreakpoint: const Breakpoint(endWidth: 700),
        mediumBreakpoint: const Breakpoint(beginWidth: 700, endWidth: 1000),
        mediumLargeBreakpoint: const Breakpoint(beginWidth: 1000, endWidth: 1200),
        largeBreakpoint: const Breakpoint(beginWidth: 1200, endWidth: 1600),
        extraLargeBreakpoint: const Breakpoint(beginWidth: 1600),
        useDrawer: false,
        selectedIndex: selectedNavigation,
        onSelectedIndexChange: (int newIndex) {
          ref.read(selectedNavigationProvider.notifier).state = newIndex;
        },
        destinations: navigationDestinations,
        smallBody: (_) => getBodyContent(selectedNavigation, selectedRecipe, selectedRecipeDetail, ref),
        body: (_) => getBodyContent(selectedNavigation, selectedRecipe, selectedRecipeDetail, ref),
        mediumLargeBody: (_) => Row(
          children: [
            Expanded(
              flex: 1,
              child: getBodyContent(selectedNavigation, selectedRecipe, selectedRecipeDetail, ref),
            ),
            Expanded(
              flex: 2,
              child: selectedRecipe == null || selectedRecipeDetail == null
                  ? const Center(child: Text("Select a recipe"))
                  : RecipeDetailTabScreen(
                recipe: selectedRecipe,
                recipeDetail: selectedRecipeDetail,
              ),
            ),
          ],
        ),
        largeBody: (_) => Row(
          children: [
            Expanded(
              flex: 1,
              child: getBodyContent(selectedNavigation, selectedRecipe, selectedRecipeDetail, ref),
            ),
            Expanded(
              flex: 2,
              child: selectedRecipe == null || selectedRecipeDetail == null
                  ? const Center(child: Text("Select a recipe"))
                  : RecipeDetailTabScreen(
                recipe: selectedRecipe,
                recipeDetail: selectedRecipeDetail,
              ),
            ),
          ],
        ),
        extraLargeBody: (_) => Row(
          children: [
            Expanded(
              flex: 1,
              child: getBodyContent(selectedNavigation, selectedRecipe, selectedRecipeDetail, ref),
            ),
            Expanded(
              flex: 2,
              child: selectedRecipe == null || selectedRecipeDetail == null
                  ? const Center(child: Text("Select a recipe"))
                  : RecipeDetailTabScreen(
                recipe: selectedRecipe,
                recipeDetail: selectedRecipeDetail,
              ),
            ),
          ],
        ),
        smallSecondaryBody: AdaptiveScaffold.emptyBuilder,
        secondaryBody: (_) => Container(
          color: const Color.fromARGB(255, 158, 225, 234),
        ),
        mediumLargeSecondaryBody: (_) => Container(
          color: const Color.fromARGB(255, 158, 225, 234),
        ),
        largeSecondaryBody: (_) => Container(
          color: const Color.fromARGB(255, 158, 225, 234),
        ),
        extraLargeSecondaryBody: (_) => Container(
          color: const Color.fromARGB(255, 158, 225, 234),
        ),
      ),
    );
  }
}