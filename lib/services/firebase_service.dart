import 'package:cloud_firestore/cloud_firestore.dart';

FirebaseFirestore db = FirebaseFirestore.instance;

Future<void> insertUser(
    String uid, String nombre, String apellido, String email) async {
  await db.collection("videojuegos").add(
      {"uid": uid, "nombre": nombre, "apellido": apellido, "email": email});
}
