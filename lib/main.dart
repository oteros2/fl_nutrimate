import 'package:NutriMate/screens/home_screen.dart';
import 'package:NutriMate/screens/loading_screen.dart';
import 'package:NutriMate/screens/screens.dart';
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
      home: const LoadingScreen(),
    );
  }
}
