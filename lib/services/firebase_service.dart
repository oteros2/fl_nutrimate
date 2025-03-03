import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../models/entities.dart';

FirebaseFirestore db = FirebaseFirestore.instance;

// Obtener los datos de un usuario
Future<Map<String, dynamic>?> getUserData(String uid) async {
  final doc =
      await FirebaseFirestore.instance.collection('usuarios').doc(uid).get();
  return doc.data();
}

//Obtener todos los usuarios de la base de datos
Future<List<Usuario>> getAllUsers() async {
  final QuerySnapshot snapshot = await db.collection('usuarios').get();
  return snapshot.docs
      .map((doc) {
        final data = doc.data() as Map<String, dynamic>;
        data['id'] = doc.id;
        return Usuario.fromMap(data);
      })
      .where((usuario) => usuario.email != "admin@nutrimate.com")
      .toList();
}

//Obtener todos los menús semanales de la base de datos
Future<List<MenuSemanal>> gatMenusSemanales() async {
  final QuerySnapshot snapshot = await db.collection('menu_semanal').get();
  return snapshot.docs.map((doc) {
    final data = doc.data() as Map<String, dynamic>;
    data['id'] = doc.id;
    return MenuSemanal.fromMap(data);
  }).toList();
}

//Obtener todas las recetas equilibradas
Future<List<Recipe>> getRecetasPorCategoria(String category) async {
  final QuerySnapshot snapshot = await db
      .collection('recetas')
      .where('category', isEqualTo: category)
      .get();
  return snapshot.docs.map((doc) {
    final data = doc.data() as Map<String, dynamic>;
    return Recipe(
      name: data['name'],
      imageUrl: data['imageUrl'],
      ingredients: List<Map<String, dynamic>>.from(data['ingredients']),
      instructions: List<String>.from(data['instructions']),
      type: MealType.values.firstWhere(
        (e) => e.toString().split('.').last == data['type'],
        orElse: () => MealType.breakfast,
      ),
      category: data['category'],
    );
  }).toList();
}

Future<List<Recipe>> loadEquilibradas() async {
  final recetas = await getRecetasPorCategoria('Equilibrado');
  return recetas;
}

Future<List<Recipe>> loadProteinas() async {
  final recetas = await getRecetasPorCategoria('Alta en proteínas');
  return recetas;
}

Future<List<Recipe>> loadGrasas() async {
  final recetas = await getRecetasPorCategoria('Bajo en grasas');
  return recetas;
}

Future<List<Recipe>> loadAumentoMusculo() async {
  final recetas = await getRecetasPorCategoria('Aumento masa muscular');
  return recetas;
}

void onRecipeSelect(Recipe recipe, User? usuario) async {
  final QuerySnapshot snapshot = (await db
      .collection('usuarios')
      .doc(usuario?.uid)
      .get()) as QuerySnapshot<Object?>;
}
