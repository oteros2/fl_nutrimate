import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:NutriMate/screens/screens.dart';

class SessionManager {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  //Comprueba si el usuario está autenticado.
  bool isLoggedIn() {
    return _auth.currentUser != null;
  }

  //Devuelve el usuario actualmente autenticado en Firebase, si existe.
  User? getCurrentUser() {
    return _auth.currentUser;
  }

  //Verifica si el usuario está autenticado y lo redirige a la pantalla que corresponda.
  void checkAuthAndRedirect(BuildContext context) {
    if (isLoggedIn()) {
      // Si el usuario está autenticado, lo lleva a la pantalla principal TabScreen
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => TabScreen()),
      );
    } else {
      // Si el usuario no está autenticado, lo envía a la pantalla de inicio de sesión LoginScreen
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const LoginScreen()),
      );
    }
  }
}
