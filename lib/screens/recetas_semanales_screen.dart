import 'package:flutter/material.dart';

class RecetasSemanalesScreen extends StatelessWidget {
  const RecetasSemanalesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Recetas Semanales'),
      ),
      body: const Center(
        child: Text('Recetas Semanales'),
      ),
    );
  }
}
