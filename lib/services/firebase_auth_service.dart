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
    //Cierra el teclado una vez que se envian los datos
    FocusScope.of(context).unfocus();
    try {
      //Crea las credenciales de acceso del usuario con email y password
      UserCredential userCredential =
          await _auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );

      //Obtiene el UID del usuario
      String uid = userCredential.user!.uid;

      //Guarda los datos del usuario en la base de datos
      await _firestore.collection('usuarios').doc(uid).set({
        'nombre': nombre,
        'apellidos': apellidos,
        'email': email,
      });

      //Muestra una ventana si todo ha salido correctamente en el registro
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
    }
    //Si se da alguna excepcion a la hora de registrar el usuario se muestra una ventana con el error.
    on FirebaseAuthException catch (e) {
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text("Error al registrar usuario"),
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
