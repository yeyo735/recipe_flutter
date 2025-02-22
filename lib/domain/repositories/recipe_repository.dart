import '../../domain/entities/recipe.dart';
import '../../domain/entities/recipe_detail.dart';

abstract class RecipeRepository {
  Future<List<Recipe>> fetchRecipes();
  Future<RecipeDetail> fetchRecipeDetail(String recipeId);
}