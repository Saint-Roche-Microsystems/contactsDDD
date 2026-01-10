import 'package:sqflite/sqflite.dart';
import '../../domain/entities/contacto.dart';

class ContactoLocalDataSource {
  final Database db; // conexión a la base de datos

  ContactoLocalDataSource(this.db);

  Future<List<Contacto>>  obtenerContactos() async {
    final result = await db.query('contactos');

    return result.map((e) => Contacto.fromMap(e)).toList();
  }

  Future<void> insertarContacto(Contacto c) async {
    await db.insert('contactos', {
      'nombre': c.nombre,
      'descripcion': c.descripcion,
      'foto': c.foto,
    });
  }
}