import 'package:NutriMate/models/entities.dart';

class Recipe {
  final String name;
  final String imageUrl;
  final List<String> instructions;
  final MealType type;
  final List<Map<String, dynamic>> ingredients;

  Recipe(
      {required this.name,
      required this.imageUrl,
      required this.ingredients,
      required this.instructions,
      required this.type});
}
