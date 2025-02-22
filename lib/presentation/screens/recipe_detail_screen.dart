import 'package:flutter/material.dart';
import '../../domain/entities/recipe.dart';
import '../../domain/entities/recipe_detail.dart';

class RecipeDetailScreen extends StatelessWidget {
  final Recipe recipe;
  final RecipeDetail recipeDetail;

  const RecipeDetailScreen({
    super.key,
    required this.recipe,
    required this.recipeDetail,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(recipe.name),
      ),
      body: Column(
        children: [
          Image.network(recipe.imageUrl),
          const SizedBox(height: 10),
          Text("Description:", style: Theme.of(context).textTheme.titleLarge),
          Text(recipeDetail.description),
          const SizedBox(height: 10),
          Text("Ingredients:", style: Theme.of(context).textTheme.titleLarge),
          ...recipeDetail.ingredients.map((ingredient) => Text("${ingredient.name}: ${ingredient.quantity}")),
          const SizedBox(height: 10),
          Text("Preparation:", style: Theme.of(context).textTheme.titleLarge),
          Text(recipeDetail.preparation),
          const SizedBox(height: 10),
          Text("Origin: ${recipe.location}"),
        ])
    );
  }
}
