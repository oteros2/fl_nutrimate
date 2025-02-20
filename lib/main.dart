import 'package:fl_nutrimate/Screens/Chart_Screen.dart';
import 'package:fl_nutrimate/widgets/circlechart_widget.dart';
import 'package:flutter/material.dart';

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
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: const Color.fromARGB(255, 70, 196, 156)),
        useMaterial3: true,
      ),
    
      home: WidgetScreen()
    );
  }
}