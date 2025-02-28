import 'entities.dart';

class Usuario {
  final String email;
  final String name;
  final String lastName;
  final double weight;
  final List<Recipe> recetas;

  Usuario({
    required this.email,
    required this.name,
    required this.lastName,
    required this.weight,
    required this.recetas,
  });

  factory Usuario.fromMap(Map<String, dynamic> map) {
    return Usuario(
      email: map['email'] ?? '',
      name: map['nombre'] ?? '',
      lastName: map['apellidos'] ?? '',
      weight: map['peso']?.toDouble() ?? 0.0,
      recetas: (map['recetas'] as List<dynamic>?)
              ?.map((recipeMap) => Recipe.fromMap(recipeMap))
              .toList() ??
          [],
    );
  }
}