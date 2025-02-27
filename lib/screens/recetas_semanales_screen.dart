import 'package:flutter/material.dart';
import '../models/entities.dart';
import '../widgets/widgets.dart';
import 'package:provider/provider.dart';
import 'package:NutriMate/providers/user_provider.dart';

class RecetasSemanalesScreen extends StatelessWidget {
  const RecetasSemanalesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final Usuario usuario = Provider.of<UserProvider>(context).usuario!;
    final String nombre = usuario.name;
    final String apellido = usuario.lastName.split(" ")[0];
    return Scaffold(
      body: NestedScrollView(
        headerSliverBuilder: (context, innerBoxIsScrolled) => [
          CustomAppbar(
              title: 'Recetas semanales', user: usuario),
        ],
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
      ),
    );
  }
}
