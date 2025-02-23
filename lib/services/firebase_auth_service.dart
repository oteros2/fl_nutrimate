import 'package:NutriMate/screens/login_screen.dart';
import 'package:NutriMate/theme/app_theme.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:quickalert/models/quickalert_type.dart';
import 'package:quickalert/widgets/quickalert_dialog.dart';

class AuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

//Traduce los mensajes de error por defecto de firebase
  String _getErrorMessage(String errorCode) {
    switch (errorCode) {
      case 'weak-password':
        return 'La contraseña es demasiado débil.';
      case 'email-already-in-use':
        return 'El correo electrónico ya está en uso.';
      case 'invalid-email':
        return 'El correo electrónico no es válido.';
      case 'operation-not-allowed':
        return 'La operación no está permitida.';
      case 'user-disabled':
        return 'El usuario ha sido deshabilitado.';
      case 'user-not-found':
        return 'Usuario no existe';
      case 'wrong-password':
        return 'La contraseña es incorrecta.';
      default:
        return 'Ha ocurrido un error inesperado.';
    }
  }

  //Funcion para registrar un usuario
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
      QuickAlert.show(
        context: context,
        type: QuickAlertType.success,
        title: "Usuario registrado correctamente",
        showConfirmBtn: false,
      );

      Future.delayed(Duration(seconds: 3), () {
        Navigator.of(context).pop();
        Navigator.of(context).pushReplacement(
          MaterialPageRoute(
            builder: (context) => const LoginScreen(),
          ),
        );
      });

      return null;
    }
    //Si se da alguna excepcion a la hora de registrar el usuario se muestra una ventana con el error.
    on FirebaseAuthException catch (e) {
      String errorMessage = _getErrorMessage(e.code);
      QuickAlert.show(
        context: context,
        type: QuickAlertType.error,
        title: "Error al registrar el usuario",
        text: errorMessage,
        confirmBtnText: "OK",
        confirmBtnColor: AppTheme.primary,
        onConfirmBtnTap: () {
          Navigator.of(context).pop();
        },
      );
      return e.message;
    }
  }

  // Iniciar sesión con email y contraseña
  Future<User?> signIn(
      String email, String password, BuildContext context) async {
    try {
      UserCredential userCredential = await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: email, password: password);
      return userCredential.user;
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        QuickAlert.show(
          context: context,
          type: QuickAlertType.error,
          title: "Error al iniciar sesión",
          text: "El usuario no existe",
          confirmBtnText: "OK",
          confirmBtnColor: Theme.of(context).primaryColor,
          onConfirmBtnTap: () {
            Navigator.of(context).pop();
          },
        );
      } else if (e.code == 'wrong-password') {
        QuickAlert.show(
          context: context,
          type: QuickAlertType.error,
          title: "Error al iniciar sesión",
          text: "La contraseña es incorrecta",
          confirmBtnText: "OK",
          confirmBtnColor: Theme.of(context).primaryColor,
          onConfirmBtnTap: () {
            Navigator.of(context).pop();
          },
        );
      } else {
        QuickAlert.show(
          context: context,
          type: QuickAlertType.error,
          title: "Error al iniciar sesión",
          text: "Ocurrió un error inesperado: ${e.message}",
          confirmBtnText: "OK",
          confirmBtnColor: Theme.of(context).primaryColor,
          onConfirmBtnTap: () {
            Navigator.of(context).pop();
          },
        );
      }
    }
    return null;
  }
}
