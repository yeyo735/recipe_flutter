import 'package:recipe_flutter/domain/entities/recipe.dart';

import '../repositories/recipe_repository.dart';

class GetRecipesUseCase {
  final RecipeRepository _recipeRepository;

  GetRecipesUseCase(this._recipeRepository);

  Future<List<Recipe>> call() async {
    return await _recipeRepository.fetchRecipes();
  }
}