import 'package:NutriMate/widgets/custom_appbar.dart';
import 'package:flutter/material.dart';

import '../models/user.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key, required this.user});

  final User user;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: CustomScrollView(slivers: [
      CustomAppbar(
        title: 'Inicio',
        user: User(
          email: 'juan.perez@example.com',
          password: 'password123',
          name: 'Juan',
          lastName: 'Pérez',
          weight: 70.5,
          phone: '555-123-4567',
        ),
      ),
    ]));
  }
}
