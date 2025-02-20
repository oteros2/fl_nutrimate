import 'package:fl_nutrimate/Screens/Chart_Screen.dart';
import 'package:flutter/material.dart';
import 'package:persistent_bottom_nav_bar/persistent_bottom_nav_bar.dart';

class TalScreen extends StatelessWidget {
  final PersistentTabController _controller =
      PersistentTabController(initialIndex: 0);

  TalScreen({super.key});

  /// Para un código más legible, las listas las estoy definiendo por separado, en este caso screens pide una lista de Widgets
  /// que serán nuestras screens por lo tanto he creado una lista de tipo Widget y he metido las screen a usar

  List<Widget> _buildScreens() {
    return [
      Placeholder(), // Si llamo a esta misma screen explota (Por experiencia)
    const ChartScreen(),
    ];
  }

  ///
  ///* En esta lista vamos a guardar los items de la tabbar, aquí vamos a tener el nombre, color titulo etc de los botones
 ///* de la tabbar
 ///
  List<PersistentBottomNavBarItem> _navBarItems(){
    return [
      PersistentBottomNavBarItem(
        icon: const Icon(Icons.home_max),
        title: "Inicio",
        activeColorPrimary: Colors.teal,
        inactiveColorPrimary: Colors.grey,
      ),
       PersistentBottomNavBarItem(
        icon: const Icon(Icons.settings),
        title: "Configuración",
        activeColorPrimary: Colors.teal,
        inactiveColorPrimary: Colors.grey,
      ),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return PersistentTabView(
      context,
      controller: _controller, 
      screens: _buildScreens(), // y aquí metemos las listas
      items: _navBarItems(),
      handleAndroidBackButtonPress: false,
      resizeToAvoidBottomInset: true,
      stateManagement: true,
      hideNavigationBarWhenKeyboardAppears: true,
      backgroundColor: Colors.grey,
      isVisible: true,
      animationSettings: const NavBarAnimationSettings(
        navBarItemAnimation: ItemAnimationSettings(
          duration: Duration(milliseconds: 750),
          curve: Curves.ease,
        )
      ),
      navBarStyle: NavBarStyle.style7,
      );
  }
  
  
}