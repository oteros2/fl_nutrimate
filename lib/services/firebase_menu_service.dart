import 'package:NutriMate/models/entities.dart';
import 'package:NutriMate/services/firebase_service.dart';

Future<void> insertMenuDiario(MenuDiario menuDiario) async {
  final Map<String, dynamic> menu = menuDiario.toMap();
  await db.collection("menu_diario").add(menu);
}

Future<void> insertMenuSemanal(MenuSemanal menuSemanal) async {
  final Map<String, dynamic> menu = menuSemanal.toMap();
  await db.collection("menu_semanal").add(menu);
}

