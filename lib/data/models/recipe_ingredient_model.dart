import 'package:hive/hive.dart';

@HiveType(typeId: 3)
class RecipeIngredientModel {
  @HiveField(0)
  final String name;
  @HiveField(1)
  final String quantity;

  RecipeIngredientModel({required this.name, required this.quantity});

  factory RecipeIngredientModel.fromJson(Map<String, dynamic> json) {
    return RecipeIngredientModel(
      name: json['name'] as String,
      quantity: json['quantity'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'quantity': quantity,
    };
  }
}
