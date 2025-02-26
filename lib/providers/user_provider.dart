import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import '../services/services.dart';

class UserProvider with ChangeNotifier {
  User? _user;
  Map<String, dynamic>? _userData;

  UserProvider() {
    loadUser();
  }

  Future<void> loadUser() async {
    final user = await getUser();
    if (user != null) {
      print('UserProvider: User loaded: ${user.email}');
      _user = user;
      _userData = await getUserData(user.uid);
      notifyListeners();
    }
  }

  User? get user => _user;
  Map<String, dynamic>? get userData => _userData;

  Future<User?> getUser() async {
    return FirebaseAuth.instance.currentUser;
  }
}
