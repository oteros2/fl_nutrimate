import 'package:NutriMate/screens/charge_screen.dart';
import 'package:flutter/material.dart';
import 'package:NutriMate/theme/app_theme.dart';

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
      home: const ChargeScreen(),
      );
  }
}