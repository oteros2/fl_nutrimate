import 'package:cloud_firestore/cloud_firestore.dart';

FirebaseFirestore db = FirebaseFirestore.instance;

Future<void> insertUser(String nombre, String apellido, String email) async {
  await db
      .collection("usuarios")
      .add({"nombre": nombre, "apellido": apellido, "email": email});
}
