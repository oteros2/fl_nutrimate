import 'package:NutriMate/screens/login_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class AuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<String?> registerUser({
    required String nombre,
    required String apellidos,
    required String email,
    required String password,
    required BuildContext context,
  }) async {
    FocusScope.of(context).unfocus();
    try {
      UserCredential userCredential =
          await _auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );

      String uid = userCredential.user!.uid;

      await _firestore.collection('usuarios').doc(uid).set({
        'nombre': nombre,
        'apellidos': apellidos,
        'email': email,
      });

      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text("Éxito"),
            content: Text("Usuario registrado con éxito!"),
            actions: [
              TextButton(
                child: Text("OK"),
                onPressed: () {
                  Navigator.of(context).pop();
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const LoginScreen()),
                  );
                },
              ),
            ],
          );
        },
      );

      return null;
    } on FirebaseAuthException catch (e) {
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text("Erro al registrar usuario"),
            content: Text(e.message ?? "Error al registrar usuario"),
            actions: [
              TextButton(
                child: Text("OK"),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
            ],
          );
        },
      );
      return e.message;
    }
  }
}
