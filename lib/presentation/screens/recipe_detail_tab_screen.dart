import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart'; // For kIsWeb and defaultTargetPlatform
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../domain/entities/recipe.dart';
import '../../domain/entities/recipe_detail.dart';
import '../screens/recipe_detail_screen.dart';
import '../screens/recipe_map_screen.dart';
import '../widgets/topbar.dart';

class RecipeDetailTabScreen extends ConsumerWidget {
  final Recipe recipe;
  final RecipeDetail recipeDetail;

  const RecipeDetailTabScreen({
    super.key,
    required this.recipe,
    required this.recipeDetail,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // Check if we are on a platform that uses Cupertino (iOS/macOS) or not
    final bool isCupertino = !kIsWeb &&
        (defaultTargetPlatform == TargetPlatform.iOS ||
            defaultTargetPlatform == TargetPlatform.macOS);
    if (!isCupertino) {
      // **Material Version**
      return Scaffold(
        appBar:
        (MediaQuery.of(context).size.width < 720)
            ? TopBar(
          title: recipe.name,
          showBackButton: true,
          onBackPressed: () {},
        )
            : null,
        extendBody: true,
        body: DefaultTabController(
          length: 2,
          child: Column(
            children: [
              const TabBar(
                indicatorColor: Colors.blue,
                unselectedLabelColor: Colors.grey,
                tabs: [Tab(text: "Details"), Tab(text: "Map")],
              ),
              Expanded(
                child: TabBarView(
                  children: [
                    RecipeDetailScreen(
                      recipe: recipe,
                      recipeDetail: recipeDetail,
                    ),
                    RecipeMapScreen(recipe: recipe),
                  ],
                ),
              ),
            ],
          ),
        ),
      );
    } else {
      // **Cupertino Version**
      return CupertinoPageScaffold(
        child: CupertinoTabScaffold(
          tabBar: CupertinoTabBar(
            items: const [
              BottomNavigationBarItem(
                icon: Icon(CupertinoIcons.info),
                label: 'Details',
              ),
              BottomNavigationBarItem(
                icon: Icon(CupertinoIcons.map),
                label: 'Map',
              ),
            ],
          ),
          tabBuilder: (context, index) {
            switch (index) {
              case 0:
                return RecipeDetailScreen(
                  recipe: recipe,
                  recipeDetail: recipeDetail,
                );
              case 1:
                return RecipeMapScreen(recipe: recipe);
              default:
                return const SizedBox.shrink();
            }
          },
        ),
      );
    }
  }
}
