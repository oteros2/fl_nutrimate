import 'package:NutriMate/services/firebase_service.dart';
import 'package:NutriMate/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:NutriMate/providers/user_provider.dart';
import '../models/entities.dart';

class CambioRecetaScreen extends StatefulWidget {
  final Recipe recetaOriginal;

  CambioRecetaScreen({super.key, required this.recetaOriginal});

  @override
  State<CambioRecetaScreen> createState() => _CambioRecetaScreenState();
}

class _CambioRecetaScreenState extends State<CambioRecetaScreen> {
  Future<List<Recipe>> loadEquilibradas() async {
    final recetas = await getRecetasPorCategoria('Equilibrado');
    return recetas;
  }

  Future<List<Recipe>> loadProteinas() async {
    final recetas = await getRecetasPorCategoria('Alta en proteínas');
    return recetas;
  }

  Future<List<Recipe>> loadGrasas() async {
    final recetas = await getRecetasPorCategoria('Bajo en grasas');
    return recetas;
  }

  Future<List<Recipe>> loadAumentoMusculo() async {
    final recetas = await getRecetasPorCategoria('Aumento masa muscular');
    return recetas;
  }

  @override
  Widget build(BuildContext context) {
    final Usuario usuario = Provider.of<UserProvider>(context).usuario!;

    return Scaffold(
      body: NestedScrollView(
        headerSliverBuilder: (context, innerBoxIsScrolled) => [
          CustomAppbar(title: 'Cambiar receta', user: usuario),
        ],
        body: SingleChildScrollView(
          child: Column(
            children: [
              const SwiperFoodLabel(day: 'Equilibrado'),
              FutureBuilder<List<Recipe>>(
                future: loadEquilibradas(),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return Center(child: CircularProgressIndicator());
                  } else if (snapshot.hasError) {
                    return Center(child: Text('Error: ${snapshot.error}'));
                  } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
                    return Center(child: Text('No hay recetas disponibles.'));
                  }
                  final equilibradas = snapshot.data!;
                  return SwiperFood(
                    recipes: equilibradas,
                    icon: Icons.add,
                    isSelectionMode: true,
                    onRecipeSelect: (recipe) {
                      Navigator.pop(context, recipe);
                    },
                  );
                },
              ),
              const SwiperFoodLabel(day: 'Altas en proteínas'),
              FutureBuilder<List<Recipe>>(
                future: loadProteinas(),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return Center(child: CircularProgressIndicator());
                  } else if (snapshot.hasError) {
                    return Center(child: Text('Error: ${snapshot.error}'));
                  } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
                    return Center(child: Text('No hay recetas disponibles.'));
                  }
                  final proteinas = snapshot.data!;
                  return SwiperFood(
                    recipes: proteinas,
                    icon: Icons.add,
                    isSelectionMode: true,
                    onRecipeSelect: (recipe) {
                      Navigator.pop(context, recipe);
                    },
                  );
                },
              ),
              const SwiperFoodLabel(day: 'Bajo en grasas'),
              FutureBuilder<List<Recipe>>(
                future: loadGrasas(),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return Center(child: CircularProgressIndicator());
                  } else if (snapshot.hasError) {
                    return Center(child: Text('Error: ${snapshot.error}'));
                  } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
                    return Center(child: Text('No hay recetas disponibles.'));
                  }
                  final grasas = snapshot.data!;
                  return SwiperFood(
                    recipes: grasas,
                    icon: Icons.add,
                    isSelectionMode: true,
                    onRecipeSelect: (recipe) {
                      Navigator.pop(context, recipe);
                    },
                  );
                },
              ),
              const SwiperFoodLabel(day: 'Aumento masa muscular'),
              FutureBuilder<List<Recipe>>(
                future: loadAumentoMusculo(),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return Center(child: CircularProgressIndicator());
                  } else if (snapshot.hasError) {
                    return Center(child: Text('Error: ${snapshot.error}'));
                  } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
                    return Center(child: Text('No hay recetas disponibles.'));
                  }
                  final aumentoMusculo = snapshot.data!;
                  return SwiperFood(
                    recipes: aumentoMusculo,
                    icon: Icons.add,
                    isSelectionMode: true,
                    onRecipeSelect: (recipe) {
                      Navigator.pop(context, recipe);
                    },
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
