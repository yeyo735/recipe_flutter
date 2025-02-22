import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../domain/entities/recipe.dart';
import '../../domain/entities/recipe_detail.dart';
import '../../di/dependencies.dart';

final recipeProvider = FutureProvider<List<Recipe>>((ref) async {
  final useCase = ref.read(getRecipesUseCaseProvider);
  return useCase();
});

final recipeDetailProvider = FutureProvider.family<RecipeDetail, String>((ref, recipeId) async {
  final useCase = ref.read(getRecipeDetailUseCaseProvider);
  return useCase(recipeId);
});
