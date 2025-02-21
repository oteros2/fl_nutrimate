import 'package:flutter/material.dart';

import 'screens.dart';

class ClientesScreen extends StatelessWidget {
  const ClientesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    List<Cliente> clientes = [
      Cliente(
        nombre: "Juan",
        apellidos: "Miranda Pérez",
        avatar: const CircleAvatar(
          backgroundColor: Colors.green,
          child: Text("J"),
        ),
      ),
      Cliente(
        nombre: "María",
        apellidos: "Villar González",
        avatar: const CircleAvatar(
          backgroundColor: Colors.green,
          child: Text("M"),
        ),
      ),
      Cliente(
        nombre: "Carlos",
        apellidos: "Martos Ramírez",
        avatar: const CircleAvatar(
          backgroundColor: Colors.green,
          child: Text("C"),
        ),
      ),
      Cliente(
        nombre: "Ana",
        apellidos: "Fernández Costas",
        avatar: const CircleAvatar(
          backgroundColor: Colors.green,
          child: Text("A"),
        ),
      ),
      Cliente(
        nombre: "Luis",
        apellidos: "Martínez Abigail",
        avatar: const CircleAvatar(
          backgroundColor: Colors.green,
          child: Text("L"),
        ),
      ),
    ];
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFF00B894).withAlpha(100),
        title: const Text('Clientes Screen'),
        actions: const [
          Padding(
            padding: EdgeInsets.all(5.0),
            child: CircleAvatar(
              child: Text("A16"),
              backgroundColor: Colors.green,
            ),
          )
        ],
      ),
      body: ListView.separated(
        itemCount: clientes.length,
        separatorBuilder: (context, index) => const Divider(),
        itemBuilder: (context, index) {
          return InkWell(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const RecetasSemanalesScreen(),
                ),
              );
            },
            child: ListTile(
              leading: clientes[index].avatar,
              title: Text(
                  '${clientes[index].nombre} ${clientes[index].apellidos}'),
            ),
          );
        },
      ),
    );
  }
}

class Cliente {
  final String nombre;
  final String apellidos;
  final CircleAvatar avatar;

  Cliente({
    required this.nombre,
    required this.apellidos,
    required this.avatar,
  });
}
