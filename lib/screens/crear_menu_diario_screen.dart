import 'package:NutriMate/models/usuario.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:NutriMate/providers/user_provider.dart';

import '../widgets/widgets.dart';

class CrearMenuDiarioScreen extends StatelessWidget {
  const CrearMenuDiarioScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final Usuario usuario = Provider.of<UserProvider>(context).usuario!;
    return Scaffold(
        body: NestedScrollView(
      headerSliverBuilder: (context, innerBoxIsScrolled) => [
        CustomAppbar(title: 'Crear menú diario', user: usuario),
      ],
      body: const Center(
        child: Text('CrearMenuDiarioScreen'),
      ),
    ));
  }
}
