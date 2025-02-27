class Usuario {
  final String email;
  final String name;
  final String lastName;
  final double weight;

  Usuario({
    required this.email,
    required this.name,
    required this.lastName,
    required this.weight,
  });

  factory Usuario.fromMap(Map<String, dynamic> map) {
    return Usuario(
      email: map['email'] ?? '',
      name: map['nombre'] ?? '',
      lastName: map['apellidos'] ?? '',
      weight: map['peso']?.toDouble() ?? 0.0,
    );
  }
}
