import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart'; // For kIsWeb and defaultTargetPlatform
import 'package:flutter/material.dart';

class RecipeFavoritesScreen extends StatelessWidget {
  const RecipeFavoritesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final bool isCupertino =
        !kIsWeb &&
            (defaultTargetPlatform == TargetPlatform.iOS ||
                defaultTargetPlatform == TargetPlatform.macOS);
    if (!isCupertino) {
      return Scaffold(
        appBar: AppBar(title: Text('Favorites')),
        body: Center(child: Text('Favorites')),
      );
    } else {
      return CupertinoPageScaffold(
        navigationBar: CupertinoNavigationBar(middle: Text('Favorites')),
        child: Center(child: Text('Favorites')),
      );
    }
  }
}
