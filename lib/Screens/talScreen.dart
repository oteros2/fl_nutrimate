import 'package:fl_nutrimate/Screens/Chart_Screen.dart';
import 'package:flutter/material.dart';
import 'package:persistent_bottom_nav_bar/persistent_bottom_nav_bar.dart';


class talScreen extends StatefulWidget {
  final PersistentTabController _controller = PersistentTabController(initialIndex: 0);

  talScreen({Key? key}) : super(key: key);
  
  List<Widget> _buildScreens() {
    return [
      ChartScreen(),
    ];
  }

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
    ]
  }
  
  @override
  Widget build(BuildContext context) {
    return PersistentTabView(
      context, 
      controller: _controller, 
      screens: _buildScreens(),
      items: _navBarItems(),
      
      )
  }
  
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    throw UnimplementedError();
  }
  
}