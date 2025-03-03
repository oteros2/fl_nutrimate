import 'package:NutriMate/services/firebase_service.dart';
import 'package:NutriMate/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:NutriMate/providers/user_provider.dart';
import '../models/entities.dart';

class CambioRecetaScreen extends StatefulWidget {
  final Usuario cliente;

  CambioRecetaScreen({super.key, required this.cliente});

  @override
  State<CambioRecetaScreen> createState() => _CambioRecetaScreenState();
}

class _CambioRecetaScreenState extends State<CambioRecetaScreen> {
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
                    cliente: widget.cliente,
                    icon: Icons.add,
                    isSelectionMode: true,
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
                    cliente: widget.cliente,
                    icon: Icons.add,
                    isSelectionMode: true,
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
                    cliente: widget.cliente,
                    icon: Icons.add,
                    isSelectionMode: true,
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
                    cliente: widget.cliente,
                    icon: Icons.add,
                    isSelectionMode: true,
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
