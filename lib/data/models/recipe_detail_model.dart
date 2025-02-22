import 'package:hive/hive.dart';

import 'recipe_ingredient_model.dart';

@HiveType(typeId: 2)
class RecipeDetailModel {
  @HiveField(0)
  final String id;
  @HiveField(1)
  final String description;
  @HiveField(2)
  final String preparation;
  @HiveField(3)
  final List<RecipeIngredientModel> ingredients;

  RecipeDetailModel({
    required this.id,
    required this.description,
    required this.preparation,
    required this.ingredients,
  });

  factory RecipeDetailModel.fromJson(Map<String, dynamic> json) {
    return RecipeDetailModel(
      id: json['id'] as String,
      description: json['description'] as String,
      preparation: json['preparation'] as String,
      ingredients: (json['ingredients'] as List)
          .map((e) => RecipeIngredientModel.fromJson(e))
          .toList(),
    );
  }
}
