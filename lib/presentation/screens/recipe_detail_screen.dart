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
      body: SingleChildScrollView(
        child: Stack(
          children: <Widget>[
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Card(
                  margin: const EdgeInsets.all(0.0),
                  elevation: 4.0,
                  child: Container(
                    padding: const EdgeInsets.all(8.0),
                    child: Image.network(
                      recipe.imageUrl,
                      errorBuilder:
                          (context, error, stackTrace) => const Icon(Icons.error),
                    ),
                  ),
                ),
                const SizedBox(height: 10),
                Text(
                  "Description:",
                  style: Theme.of(context).textTheme.titleLarge,
                ),
                Text(recipeDetail.description),
                const SizedBox(height: 10),
                Card(
                  margin: const EdgeInsets.all(8.0),
                  elevation: 4.0,
                  child: Container(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                      Text(
                        "Ingredients:",
                        style: Theme.of(context).textTheme.titleLarge),
                      ...recipeDetail.ingredients.map(
                            (ingredient) =>
                            Text("${ingredient.name}: ${ingredient.quantity}"),
                      ),
                      const SizedBox(height: 10),
                      Text(
                        "Preparation:",
                        style: Theme.of(context).textTheme.titleLarge,
                      ),
                      Text(recipeDetail.preparation),
                    ],
                    ),
                  )
                ),
                const SizedBox(height: 10),
                Text("Origin: ${recipe.location}"),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
