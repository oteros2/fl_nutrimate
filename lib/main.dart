import 'package:NutriMate/screens/charge_screen.dart';
import 'package:NutriMate/screens/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:NutriMate/theme/app_theme.dart';

import 'models/user.dart';
import 'screens/settings_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'NutriMate',
      debugShowCheckedModeBanner: false,
      theme: AppTheme.lightTheme,
      home: HomeScreen(
        user: User(
          email: 'juan.perez@example.com',
          password: 'password123',
          name: 'Juan',
          lastName: 'Pérez',
          weight: 70.5,
          phone: '555-123-4567',
        ),
      ),
    );
  }
}
