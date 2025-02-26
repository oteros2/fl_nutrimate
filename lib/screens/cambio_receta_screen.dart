import 'package:NutriMate/widgets/widgets.dart';
import 'package:flutter/material.dart';

import '../models/entities.dart';

class CambioRecetaScreen extends StatelessWidget {
  const CambioRecetaScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFF00B894).withAlpha(100),
        title: const Text('Cambio de Receta'),
        actions: const [
          Padding(
            padding: EdgeInsets.all(5.0),
            child: CircleAvatar(
              child: Text("A16"),
              backgroundColor: Colors.green,
            ),
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SwiperFoodLabel(day: 'Equilibrado'),
            SwiperFood(recipes: recipes, icon: Icons.add),
            const SwiperFoodLabel(day: 'Bajo en calorías'),
            SwiperFood(recipes: recipes, icon: Icons.add),
            const SwiperFoodLabel(day: 'Alto en proteínas'),
            SwiperFood(recipes: recipes, icon: Icons.add),
            const SwiperFoodLabel(day: 'Bajo en grasas'),
            SwiperFood(recipes: recipes, icon: Icons.add),
          ],
        ),
      ),
    );
  }
}
