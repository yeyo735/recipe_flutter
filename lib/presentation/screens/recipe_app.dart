import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart'; // For kIsWeb and defaultTargetPlatform
import 'package:flutter/material.dart';
import 'package:flutter_adaptive_scaffold/flutter_adaptive_scaffold.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:recipe_flutter/presentation/screens/recipe_detail_tab_screen.dart';
import 'package:recipe_flutter/presentation/screens/recipe_favorites_screen.dart';
import 'package:recipe_flutter/presentation/screens/recipe_home_screen.dart';
import 'package:recipe_flutter/presentation/widgets/topbar.dart';

import '../../di/dependencies.dart';
import '../../domain/entities/recipe.dart';
import '../../domain/entities/recipe_detail.dart';
import '../../router/navigation_provider.dart';

// State providers
final selectedRecipeProvider = StateProvider<Recipe?>((ref) => null);
final selectedRecipeDetailProvider = StateProvider<RecipeDetail?>(
  (ref) => null,
);
final selectedNavigationProvider = StateProvider<int>((ref) => 0);

class RecipeApp extends ConsumerWidget {
  const RecipeApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final bool isCupertino = !kIsWeb && defaultTargetPlatform == TargetPlatform.iOS;
    final selectedRecipe = ref.watch(selectedRecipeProvider);
    final selectedRecipeDetail = ref.watch(selectedRecipeDetailProvider);
    final selectedNavigation = ref.watch(selectedNavigationProvider);

    void selectRecipe(BuildContext context, String recipeId) async {
      final recipes = await ref.read(getRecipesUseCaseProvider)();
      final recipe = recipes.firstWhere((element) => element.id == recipeId);
      final recipeDetail = await ref.read(getRecipeDetailUseCaseProvider)(
        recipeId,
      );

      ref.read(selectedRecipeProvider.notifier).state = recipe;
      ref.read(selectedRecipeDetailProvider.notifier).state = recipeDetail;

      if (MediaQuery.of(context).size.width < 700) {
        Navigator.push(
          context,
          isCupertino
              ? CupertinoPageRoute(
                builder:
                    (context) => RecipeDetailTabScreen(
                      recipe: recipe,
                      recipeDetail: recipeDetail,
                    ),
              )
              : MaterialPageRoute(
                builder:
                    (context) => RecipeDetailTabScreen(
                      recipe: recipe,
                      recipeDetail: recipeDetail,
                    ),
              ),
        );
      }
    }

    // Navigation destinations
    Widget getBodyContent(int selectedNavigation, WidgetRef ref) {
      switch (selectedNavigation) {
        case 0:
          return Expanded(
            flex: 2,
            child: RecipeHomeScreen(
              onRecipeSelected: (recipeId) => selectRecipe(context, recipeId),
            ),
          );
        case 1:
          return Expanded(flex: 2, child: RecipeFavoritesScreen());
        /*case 2:
          return const RecipeProfileScreen();
        case 3:
          return const RecipeSettingsScreen();
        case 4:
          return const RecipeLogoutScreen();*/
        default:
          return const Center(child: Text("Unknown Screen"));
      }
    }

    Widget getScreen(int index) {
      switch (index) {
        case 0:
          return RecipeHomeScreen(
            onRecipeSelected: (recipeId) => selectRecipe(context, recipeId),
          );
        case 1:
          return RecipeFavoritesScreen();
        /*case 2:
          return RecipeProfileScreen();
        case 3:
          return RecipeSettingsScreen();
        case 4:
          return RecipeLogoutScreen();*/
        default:
          return Center(child: Text("Unknown Screen"));
      }
    }

    // Function to get the secondary body content
    Widget getSecondaryBody(
      int selectedNavigation,
      Recipe? selectedRecipe,
      RecipeDetail? selectedRecipeDetail,
    ) {
      // If we are in the details screen, we show the RecipeDetailTabScreen
      if (selectedNavigation == 0 || selectedNavigation == 1) {
        return (selectedRecipe == null || selectedRecipeDetail == null)
            ? const Center(child: Text("Select a recipe"))
            : RecipeDetailTabScreen(
              recipe: selectedRecipe,
              recipeDetail: selectedRecipeDetail,
            );
      }
      // In any other case, we return an empty container
      return const SizedBox.shrink();
    }

    if (!isCupertino) {
      return Scaffold(
        appBar: TopBar(
          title: selectedRecipe == null ? "Recipe App" : selectedRecipe.name,
          showBackButton: false,
          onBackPressed: () {
            ref.read(selectedRecipeProvider.notifier).state = null;
            ref.read(selectedRecipeDetailProvider.notifier).state = null;
          },
        ),
        body: AdaptiveScaffold(
          // Transition duration
          transitionDuration: const Duration(milliseconds: 300),
          // **Breakpoints**
          smallBreakpoint: const Breakpoint(endWidth: 700),
          mediumBreakpoint: const Breakpoint(beginWidth: 700, endWidth: 960),
          mediumLargeBreakpoint: const Breakpoint(
            beginWidth: 960,
            endWidth: 1280,
          ),
          largeBreakpoint: const Breakpoint(beginWidth: 1280, endWidth: 1440),
          extraLargeBreakpoint: const Breakpoint(beginWidth: 1440),
          // Use drawer
          useDrawer: true,
          // Navigation index
          selectedIndex: selectedNavigation,
          onSelectedIndexChange: (int newIndex) {
            ref.read(selectedNavigationProvider.notifier).state = newIndex;
            if (newIndex > 1) {
              ref.read(selectedRecipeProvider.notifier).state = null;
              ref.read(selectedRecipeDetailProvider.notifier).state = null;
            }
          },
          //bodyOrientation: Axis.vertical,
          // Navigation destinations
          destinations: navigationDestinations,
          // Main body
          smallBody: (_) => getBodyContent(selectedNavigation, ref),

          //body: (_) => getBodyContent(selectedNavigation, ref),
          body:
              (_) =>
                  (selectedNavigation == 0 || selectedNavigation == 1) &&
                          (MediaQuery.of(context).size.width > 699)
                      ? Row(
                        children: [
                          Expanded(
                            flex: 2,
                            child: getBodyContent(selectedNavigation, ref),
                          ),
                          Expanded(
                            flex: 3,
                            child:
                                selectedRecipe == null ||
                                        selectedRecipeDetail == null
                                    ? const Center(
                                      child: Text("Select a recipe"),
                                    )
                                    : getSecondaryBody(
                                      selectedNavigation,
                                      selectedRecipe,
                                      selectedRecipeDetail,
                                    ),
                          ),
                        ],
                      )
                      : getBodyContent(selectedNavigation, ref),
        ),
      );
    } else {
      // **🚀 Cupertino Version**
      return CupertinoTabScaffold(
        tabBar: CupertinoTabBar(
          items: cupertinoDestinations,
          onTap: (index) {
            ref.read(selectedNavigationProvider.notifier).state = index;
          },
          currentIndex: selectedNavigation,
        ),
        tabBuilder: (context, index) {
          return CupertinoPageScaffold(
            navigationBar: CupertinoNavigationBar(
              middle: Text(selectedRecipe?.name ?? "Recipe App"),
              trailing:
                  selectedRecipe == null
                      ? null
                      : CupertinoButton(
                        padding: EdgeInsets.zero,
                        onPressed: () {
                          ref.read(selectedRecipeProvider.notifier).state =
                              null;
                          ref
                              .read(selectedRecipeDetailProvider.notifier)
                              .state = null;
                        },
                        child: Icon(
                          CupertinoIcons.clear
                        ),
                      ),
            ),
            child: getScreen(index),
          );
        },
      );
    }
  }
}
