import 'package:dio/dio.dart';
import '../models/recipe_detail_model.dart';
import '../models/recipe_model.dart';

class RecipeApiService {
  final Dio _dio = Dio(BaseOptions(baseUrl: 'https://7j98z.wiremockapi.cloud'));

  RecipeApiService(Dio read);

  Future<List<RecipeModel>> getRecipes() async {
    final response = await _dio.get('/recipes');
    return (response.data as List).map((e) => RecipeModel.fromJson(e)).toList();
  }

  Future<RecipeDetailModel> getRecipeDetail(String recipeId) async {
    final response = await _dio.get('/recipe/$recipeId');
    return RecipeDetailModel.fromJson(response.data);
  }
}
