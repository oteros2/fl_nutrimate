import 'package:flutter/material.dart';
import '../models/entities.dart';
import '../widgets/widgets.dart';

class RecetasSemanalesScreen extends StatelessWidget {
  const RecetasSemanalesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFF00B894).withAlpha(100),
        title: const Text('Recetas Semanales'),
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
            const SwiperFoodLabel(day: 'Lunes', label: "Dieta del día"),
            SwiperFood(recipes: recipes, icon: Icons.edit),
            const SwiperFoodLabel(day: 'Martes', label: "Dieta del día"),
            SwiperFood(recipes: recipes, icon: Icons.edit),
            const SwiperFoodLabel(day: 'Miércoles', label: "Dieta del día"),
            SwiperFood(recipes: recipes, icon: Icons.edit),
            const SwiperFoodLabel(day: 'Jueves', label: "Dieta del día"),
            SwiperFood(recipes: recipes, icon: Icons.edit),
            const SwiperFoodLabel(day: 'Viernes', label: "Dieta del día"),
            SwiperFood(recipes: recipes, icon: Icons.edit),
            const SwiperFoodLabel(day: 'Sábado', label: "Dieta del día"),
            SwiperFood(recipes: recipes, icon: Icons.edit),
            const SwiperFoodLabel(day: 'Domingo', label: "Dieta del día"),
            SwiperFood(recipes: recipes, icon: Icons.edit),
          ],
        ),
      ),
    );
  }
}
