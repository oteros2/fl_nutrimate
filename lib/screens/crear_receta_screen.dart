import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:NutriMate/providers/user_provider.dart';
import '../models/entities.dart';
import '../widgets/widgets.dart';

class CrearRecetaScreen extends StatelessWidget {
  const CrearRecetaScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final Usuario usuario = Provider.of<UserProvider>(context).usuario!;
    return Scaffold(
        body: NestedScrollView(
      headerSliverBuilder: (context, innerBoxIsScrolled) => [
        CustomAppbar(title: 'Crear una receta', user: usuario),
      ],
      body: Center(child: const Text("CrearRecetaScreen")),
    ));
  }
}
