import 'package:cloud_firestore/cloud_firestore.dart';

FirebaseFirestore db = FirebaseFirestore.instance;

// Registra los datos de un usuario en la base de datos
Future<void> insertUser(String nombre, String apellido, String email) async {
  await db
      .collection("usuarios")
      .add({"nombre": nombre, "apellido": apellido, "email": email});
}

// Obtener los datos de un usuario
Future<Map<String, dynamic>?> getUserData(String uid) async {
  final doc =
      await FirebaseFirestore.instance.collection('usuarios').doc(uid).get();
  return doc.data();
}
