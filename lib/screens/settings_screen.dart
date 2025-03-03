import 'package:NutriMate/routes/settings_routes.dart';
import 'package:NutriMate/services/firebase_auth_service.dart';
import 'package:flutter/material.dart';
import 'package:NutriMate/widgets/widgets.dart';
import '../models/usuario.dart';
import 'screens.dart';

class SettingsScreen extends StatelessWidget {
  SettingsScreen({super.key, required this.user});
  final AuthService _auth = AuthService();
  final Usuario user;

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
      body: CustomScrollView(slivers: [
        CustomAppbar(
          title: 'Inicio',
          user: user,
        ),
        SliverList(
            delegate: SliverChildListDelegate([
          CardUser(
            user: user,
          ),
          const SizedBox(
            width: 10,
          ),
          Column(
            children: List.generate(
              SettingsRoutes.SettingsOptions.length,
              (index) {
                final option = SettingsRoutes.SettingsOptions[index];
                final isLastItem =
                    index == SettingsRoutes.SettingsOptions.length - 1;
                return Column(
                  children: [
                    ListTile(
                      leading: Icon(option.icon,
                          color: isLastItem ? Colors.red : null),
                      title: Text(
                        option.name,
                        style: TextStyle(
                          color: isLastItem ? Colors.red : null,
                          fontWeight:
                              isLastItem ? FontWeight.bold : FontWeight.normal,
                        ),
                      ),
                      onTap: () async {
                        if (isLastItem) {
                          await _auth.signOut(context);
                          Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => LoginScreen()));
                        } else {
                          Navigator.pushNamed(context, option.route);
                        }
                      },
                    ),
                    if (!isLastItem) Divider(),
                  ],
                );
              },
            ),
          ),
        ])),
      ]),
      floatingActionButton: FloatingActionButton(
        child: const Icon(
          Icons.logout,
          color: Colors.white,
        ),
        backgroundColor: Colors.red,
        onPressed: () async => await _auth.signOut(context),
      ),
    );
  }
}
