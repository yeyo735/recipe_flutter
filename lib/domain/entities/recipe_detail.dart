import 'package:recipe_flutter/domain/entities/recipe_ingredients.dart';

class RecipeDetail {
  final String id;
  final String description;
  final List<RecipeIngredient> ingredients;
  final String preparation;

  RecipeDetail({
    required this.id,
    required this.description,
    required this.ingredients,
    required this.preparation,
  });
}
