import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:dio/dio.dart';
import '../../domain/repositories/recipe_repository.dart';
import '../../domain/usecases/get_recipe_detail_usecase.dart';
import '../../domain/usecases/get_recipes_usecase.dart';
import '../data/repositories/recipe_repository_impl.dart';
import '../data/sources/recipe_api_service.dart';

// Injection of Dio Client
final dioProvider = Provider<Dio>((ref) => Dio());

// Injection of API Service
final apiServiceProvider = Provider<RecipeApiService>(
      (ref) => RecipeApiService(ref.read(dioProvider)),
);

// Injection of Repository
final recipeRepositoryProvider = Provider<RecipeRepository>(
      (ref) => RecipeRepositoryImpl(ref.read(apiServiceProvider)),
);

// Injection of UseCases
final getRecipesUseCaseProvider = Provider<GetRecipesUseCase>(
      (ref) => GetRecipesUseCase(ref.read(recipeRepositoryProvider)),
);

final getRecipeDetailUseCaseProvider = Provider<GetRecipeDetailUseCase>(
      (ref) => GetRecipeDetailUseCase(ref.read(recipeRepositoryProvider)),
);
