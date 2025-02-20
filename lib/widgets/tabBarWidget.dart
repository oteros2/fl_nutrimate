import 'package:flutter/material.dart';

class BottomNavBar extends StatelessWidget {
  final int currentIndex;
  final Function(int) onTap;

  const BottomNavBar({
    Key? key,
    required this.currentIndex,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      currentIndex: currentIndex, // Índice de la pantalla actual
      onTap: onTap, // Función para cambiar de pantalla
      selectedItemColor: Colors.teal, // Color cuando está seleccionado
      unselectedItemColor: Colors.grey, // Color cuando NO está seleccionado
      showSelectedLabels: true,
      showUnselectedLabels: true,
      type: BottomNavigationBarType.fixed, // Mantiene todos los íconos visibles
      items: const [
        BottomNavigationBarItem(
          icon: Icon(Icons.home),
          label: 'Inicio',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.book),
          label: 'Recetas',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.access_time),
          label: 'Progreso',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.settings),
          label: 'Configuración',
        ),
      ],
    );
  }
}
