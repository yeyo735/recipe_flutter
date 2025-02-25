import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import '../../domain/entities/recipe.dart';

class RecipeMapScreen extends StatelessWidget {
  final Recipe recipe;

  const RecipeMapScreen({super.key, required this.recipe});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GoogleMap(
        initialCameraPosition: CameraPosition(
          target: LatLng(recipe.latitude, recipe.longitude),
          zoom: 10,
        ),
        markers: {
          Marker(
            markerId: MarkerId(recipe.id),
            position: LatLng(recipe.latitude, recipe.longitude),
            infoWindow: InfoWindow(title: recipe.name),
          ),
        },
      ),
    );
  }
}
