import 'package:fl_nutrimate/screens/settings-screen.dart';
import 'package:flutter/material.dart';
import 'screens/screens.dart';

//#00B894
void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Nutrimate - Guillermo',
        initialRoute: 'settings',
        debugShowCheckedModeBanner: false,
        routes: {
          'receta-diaria': (context) => const RecetaDiariaScreen(),
          'recetas-semanales': (context) => const RecetasSemanalesScreen(),
          'clientes': (context) => const ClientesScreen(),
          'cambio-receta': (context) => const CambioRecetaScreen(),
          'settings': (context) => const SettingsScreen(),
        });
  }
}
