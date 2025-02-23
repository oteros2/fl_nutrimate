import 'package:flutter/material.dart';
import 'package:NutriMate/widgets/widgets.dart';
import '../models/usuario.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key, required this.user});

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
        ])),
      ]),
    );
  }
}
