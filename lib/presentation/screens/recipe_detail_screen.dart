import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart'; // For kIsWeb and defaultTargetPlatform
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
    final bool isCupertino =
        !kIsWeb &&
        (defaultTargetPlatform == TargetPlatform.iOS ||
            defaultTargetPlatform == TargetPlatform.macOS);
    if (!isCupertino) {
      return Scaffold(
        body: SingleChildScrollView(
          padding: const EdgeInsets.all(8.0),
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
                            (context, error, stackTrace) =>
                                const Icon(Icons.error),
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
                            style: Theme.of(context).textTheme.titleLarge,
                          ),
                          ...recipeDetail.ingredients.map(
                            (ingredient) => Text(
                              "${ingredient.name}: ${ingredient.quantity}",
                            ),
                          ),
                          const SizedBox(height: 10),
                          Text(
                            "Preparation:",
                            style: Theme.of(context).textTheme.titleLarge,
                          ),
                          Text(recipeDetail.preparation),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(height: 10),
                  Text("Origin: ${recipe.location}"),
                ],
              ),
            ],
          ),
        ),
      );
    } else {
      return CupertinoPageScaffold(
        child: CustomScrollView(
          slivers: <Widget>[
            CupertinoSliverNavigationBar(
              largeTitle: Text(recipe.name),
              trailing: CupertinoButton(
                padding: EdgeInsets.zero,
                child: const Icon(CupertinoIcons.heart),
                onPressed: () {},
              ),
            ),
            SliverList(
              delegate: SliverChildListDelegate(<Widget>[
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
                              (context, error, stackTrace) =>
                                  const Icon(Icons.error),
                        ),
                      ),
                    ),
                    const SizedBox(height: 10),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        "Description:",
                        style: Theme.of(context).textTheme.titleLarge,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        recipeDetail.description,
                        style: Theme.of(context).textTheme.bodyLarge,
                      ),
                    ),
                    const SizedBox(height: 10),
                    Card(
                      margin: const EdgeInsets.all(8.0),
                      elevation: 4.0,
                      child: Container(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(
                                "Ingredients:",
                                style: Theme.of(context).textTheme.titleLarge,
                              ),
                            ),
                            ...recipeDetail.ingredients.map(
                              (ingredient) => Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text(
                                  "${ingredient.name}: ${ingredient.quantity}",
                                ),
                              ),
                            ),
                            const SizedBox(height: 10),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(
                                "Preparation:",
                                style: Theme.of(context).textTheme.titleLarge,
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(recipeDetail.preparation),
                            ),
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(height: 10),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text("Origin: ${recipe.location}"),
                    ),
                    const SizedBox(height: 64),
                  ],
                ),
              ]),
            ),
          ],
        ),
      );
    }
  }
}
