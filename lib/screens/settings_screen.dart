import 'package:NutriMate/theme/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:NutriMate/widgets/widgets.dart';
import '../models/user.dart';
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
        body: SingleChildScrollView(
          child: Column(
            children: [
              CardUser(
                user: User(
                  email: 'juan.perez@example.com',
                  password: 'password123',
                  name: 'Juan',
                  lastName: 'Pérez',
                  weight: 70.5,
                  phone: '555-123-4567',
                ),
              ),
              const SizedBox(
                width: 10,
              ),
              ListView.separated(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemBuilder: (context, index) {
                    return InkWell(
                      onTap: () {},
                      child: ListTile(
                        leading: const Icon(Icons.account_circle),
                        title: Text(settings[index]),
                      ),
                    );
                  },
                  separatorBuilder: (context, index) => const Divider(),
                  itemCount: settings.length),
            ],
          ),
        ));
  }
}
