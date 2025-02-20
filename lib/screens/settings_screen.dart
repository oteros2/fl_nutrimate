import 'package:NutriMate/theme/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:NutriMate/widgets/widgets.dart';
import 'screens.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    List<String> settings = [
      'Mi cuenta',
      'Preferencias',
      'Contacto',
      'Ayuda',
      'Acerca de',
      'Cerrar sesión'
    ];

    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppTheme.primary.withAlpha(100),
        title: const Text('Settings Screen'),
        actions: const [
          Padding(
            padding: EdgeInsets.all(5.0),
            child: CircleAvatar(
              backgroundColor: AppTheme.primary,
              child: Text("A16"),
            ),
          )
        ],
      ),
    );
  }
}
