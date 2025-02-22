import 'package:hive/hive.dart';

@HiveType(typeId: 1)
class RecipeModel {
  @HiveField(0)
  late final String id;
  @HiveField(1)
  late final String name;
  @HiveField(2)
  late final String picture;
  @HiveField(3)
  late final String location;
  @HiveField(5)
  late final String latitude;
  @HiveField(6)
  late final String longitude;

  RecipeModel({
    required this.id,
    required this.name,
    required this.picture,
    required this.location,
    required this.latitude,
    required this.longitude,
  });

  factory RecipeModel.fromJson(Map<String, dynamic> json) {
    return RecipeModel(
      id: json['id'] as String,
      name: json['name'] as String,
      picture: json['picture'] as String,
      location: json['location'] as String,
      latitude: json['latitude'] as String,
      longitude: json['longitude'] as String,
    );
  }
}
