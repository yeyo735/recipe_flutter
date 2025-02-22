import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../providers/recipe_provider.dart';

class RecipeList extends ConsumerWidget {
  final Function(String) onRecipeSelected;

  const RecipeList({super.key, required this.onRecipeSelected});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final recipesAsyncValue = ref.watch(recipeProvider);

    return recipesAsyncValue.when(
      data: (recipes) {
        return ListView.builder(
          itemCount: recipes.length,
          itemBuilder: (context, index) {
            final recipe = recipes[index];
            return ListTile(
              leading: Image.network(
                recipe.imageUrl,
                errorBuilder: (context, error, stackTrace) =>
                const Icon(Icons.error), // Manejo de errores de imagen
              ),
              title: Text(recipe.name),
              subtitle: Text(recipe.location),
              onTap: () => onRecipeSelected(recipe.id),
            );
          },
        );
      },
      loading: () => const Center(child: CircularProgressIndicator()),
      error: (error, stackTrace) => Center(child: Text('Error: $error')),
    );
  }
}
