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

  factory Recipe.fromMap(Map<String, dynamic> map) {
    return Recipe(
      name: map['name'] ?? '',
      imageUrl: map['imageUrl'] ?? '',
      instructions: List<String>.from(map['instructions'] ?? []),
      type: MealType.values.firstWhere(
        (e) => e.toString() == 'MealType.${map['type']}',
        orElse: () => MealType.breakfast,
      ),
      ingredients: List<Map<String, dynamic>>.from(map['ingredients'] ?? []),
    );
  }
}
