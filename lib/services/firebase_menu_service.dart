import 'package:NutriMate/models/entities.dart';
import 'package:NutriMate/services/firebase_service.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

Future<void> insertMenuDiario(MenuDiario menuDiario) async {
  final Map<String, dynamic> menu = menuDiario.toMap();
  await db.collection("menu_diario").add(menu);
}

Future<void> insertMenuSemanal(MenuSemanal menuSemanal) async {
  final Map<String, dynamic> menu = menuSemanal.toMap();
  await db.collection("menu_semanal").add(menu);
}

Future<void> updateMenuForUser(Usuario usuario, MenuSemanal newMenu) async {
  try {
    final QuerySnapshot userQuery = await db
        .collection("usuarios")
        .where("email", isEqualTo: usuario.email)
        .get();

    if (userQuery.docs.isEmpty) {
      throw Exception("Usuario no encontrado con el email: ${usuario.email}");
    }
    final String userId = userQuery.docs.first.id;
    final Map<String, dynamic> menuMap = newMenu.toMap();
    await db.collection("usuarios").doc(userId).update({'menu': menuMap});
    print("Menú del usuario actualizado con éxito");
  } catch (e) {
    print("Error al actualizar el menú del usuario: $e");
    throw e;
  }
}
