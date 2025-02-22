import 'package:go_router/go_router.dart';
import 'package:recipe_flutter/presentation/screens/recipe_home_screen.dart';
import '../../domain/entities/recipe.dart';
import '../../domain/entities/recipe_detail.dart';
import '../presentation/screens/recipe_detail_tab_screen.dart';

final router = GoRouter(
  initialLocation: '/',
  routes: [
    GoRoute(
      path: '/',
      name: 'home',
      builder: (context, state) => RecipeHomeScreen(
        onRecipeSelected: (recipeId) {
          // Redirección cuando se seleccione una receta
        },
      ),
    ),
    GoRoute(
      path: '/recipe/:id',
      name: 'recipeTabDetail',
      builder: (context, state) {
        final recipe = state.extra as Recipe;
        final recipeDetail = state.extra as RecipeDetail;
        return RecipeDetailTabScreen(recipe: recipe, recipeDetail: recipeDetail);
      },
    ),
  ],
);
