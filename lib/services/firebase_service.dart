import 'package:cloud_firestore/cloud_firestore.dart';

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
