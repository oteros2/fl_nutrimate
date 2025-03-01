import 'package:flutter/material.dart';
import '../models/entities.dart';
import '../services/services.dart';
import '../widgets/widgets.dart';
import 'screens.dart';
import 'package:provider/provider.dart';
import 'package:NutriMate/providers/user_provider.dart';

class ClientesScreen extends StatefulWidget {
  ClientesScreen({super.key});

  @override
  State<ClientesScreen> createState() => _ClientesScreenState();
}

class _ClientesScreenState extends State<ClientesScreen> {
  final AuthService _auth = AuthService();
  List<Usuario> _usuarios = [];

  @override
  void initState() {
    super.initState();
    _loadUsers();
  }

  Future<void> _loadUsers() async {
    final usuarios = await getAllUsers();
    setState(() {
      _usuarios = usuarios;
    });
  }

  @override
  Widget build(BuildContext context) {
    final Usuario usuario = Provider.of<UserProvider>(context).usuario!;
    return Scaffold(
      body: NestedScrollView(
        headerSliverBuilder: (context, innerBoxIsScrolled) => [
          CustomAppbar(title: 'Mis clientes', user: usuario),
        ],
        body: ListView.separated(
          padding: EdgeInsets.zero,
          itemCount: _usuarios.length,
          separatorBuilder: (context, index) => const Divider(),
          itemBuilder: (context, index) {
            final cliente = _usuarios[index];
            final inicialNombre = cliente.name[0];
            final inicialApellidos = cliente.lastName[0];
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
                leading: CircleAvatar(
                  backgroundColor: Colors.green,
                  child: Text(inicialNombre + inicialApellidos),
                ),
                title: Text('${cliente.name} ${cliente.lastName}'),
                subtitle: Text(cliente.email),
              ),
            );
          },
        ),
      ),
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
