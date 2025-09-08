import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import '../../domain/entities/recipe.dart';
import '../../domain/entities/recipe_detail.dart';
import '../presentation/screens/recipe_detail_tab_screen.dart';
import '../presentation/screens/recipe_favorites_screen.dart';
import '../presentation/screens/recipe_home_screen.dart';

final selectedRecipeProvider = StateProvider<Recipe?>((ref) => null);
final selectedRecipeDetailProvider = StateProvider<RecipeDetail?>((ref) => null);

final routerProvider = Provider<GoRouter>((ref) {
  return GoRouter(
    initialLocation: '/',
    routes: [
      GoRoute(
        path: '/',
        name: 'home',
        builder: (context, state) => RecipeHomeScreen(onRecipeSelected: (String ) {  },),
      ),
      GoRoute(
        path: '/favorites',
        name: 'favorites',
        builder: (context, state) => RecipeFavoritesScreen(),
      ),
      GoRoute(
        path: '/profile',
        name: 'profile',
        builder: (context, state) => RecipeFavoritesScreen(),
      ),
      GoRoute(
        path: '/settings',
        name: 'settings',
        builder: (context, state) => RecipeFavoritesScreen(),
      ),
      GoRoute(
        path: '/logout',
        name: 'logout',
        builder: (context, state) => RecipeFavoritesScreen(),
      ),
      GoRoute(
        path: '/recipe/:id',
        name: 'recipeTabDetail',
        builder: (context, state) {
          final recipe = ref.read(selectedRecipeProvider);
          final recipeDetail = ref.read(selectedRecipeDetailProvider);
          return RecipeDetailTabScreen(recipe: recipe!, recipeDetail: recipeDetail!);
        },
      ),
    ],
  );
});

class NavigationNotifier extends ChangeNotifier {
  final GoRouter router;

  NavigationNotifier(this.router);

  void navigateToHome() {
    router.go('/');
  }

  void navigateToFavorites() {
    router.go('/favorites');
  }

  void navigateToProfile() {
    router.go('/profile');
  }

  void navigateToSettings() {
    router.go('/settings');
  }

  void navigateToLogout() {
    router.go('/logout');
  }

  void navigateToRecipeDetail(WidgetRef ref, Recipe recipe, RecipeDetail recipeDetail) {
    ref.read(selectedRecipeProvider.notifier).state = recipe;
    ref.read(selectedRecipeDetailProvider.notifier).state = recipeDetail;
    router.go('/recipe/${recipe.id}');
  }
}

final navigationProvider = ChangeNotifierProvider<NavigationNotifier>((ref) {
  return NavigationNotifier(ref.read(routerProvider));
});
