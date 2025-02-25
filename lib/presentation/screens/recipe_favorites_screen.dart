import 'package:flutter/material.dart';

class RecipeFavoritesScreen extends StatelessWidget {
  const RecipeFavoritesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Favorites'),
      ),
      body: Center(
        child: Text('Favorites'),
      ),
    );
  }
}