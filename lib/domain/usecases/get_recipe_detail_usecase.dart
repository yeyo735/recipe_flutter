import 'package:recipe_flutter/domain/entities/recipe_detail.dart';

import '../repositories/recipe_repository.dart';

class GetRecipeDetailUseCase {
  final RecipeRepository _repository;

  GetRecipeDetailUseCase(this._repository);

  Future<RecipeDetail> call(String recipeId) async {
    return await _repository.fetchRecipeDetail(recipeId);
  }
}
