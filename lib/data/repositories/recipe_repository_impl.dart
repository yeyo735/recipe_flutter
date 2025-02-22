import '../models/recipe_detail_model.dart';
import '../models/recipe_model.dart';
import '../sources/recipe_api_service.dart';
import '../../domain/repositories/recipe_repository.dart';
import '../../domain/entities/recipe.dart';
import '../../domain/entities/recipe_detail.dart';
import '../../domain/entities/recipe_ingredients.dart';
import 'package:logger/logger.dart';

class RecipeRepositoryImpl implements RecipeRepository {
  final RecipeApiService api;
  final Logger _logger = Logger();

  RecipeRepositoryImpl(this.api);

  @override
  Future<List<Recipe>> fetchRecipes() async {
    try {
      final List<RecipeModel> recipeModels = await api.getRecipes();
      return recipeModels.map((e) => Recipe(
        id: e.id,
        name: e.name,
        imageUrl: e.picture,
        location: e.location,
        latitude: double.tryParse(e.latitude) ?? 0.0,
        longitude: double.tryParse(e.longitude) ?? 0.0,
      )).toList();
    } catch (e) {
      _logger.e('Error fetching recipes: $e');
      throw Exception('Failed to fetch recipes');
    }
  }

  @override
  Future<RecipeDetail> fetchRecipeDetail(String recipeId) async {
    try {
      final RecipeDetailModel recipeDetailModel =
      await api.getRecipeDetail(recipeId);
      return RecipeDetail(
        id: recipeDetailModel.id,
        description: recipeDetailModel.description,
        preparation: recipeDetailModel.preparation,
        ingredients: recipeDetailModel.ingredients
            .map((i) => RecipeIngredient(
          name: i.name,
          quantity: i.quantity,
        ))
            .toList(),
      );
    } catch (e) {
      _logger.e('Error fetching recipe detail: $e');
      throw Exception('Failed to fetch recipe detail');
    }
  }
}