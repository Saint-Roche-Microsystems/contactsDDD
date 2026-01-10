import '../../core/database/app_database.dart';
import '../../domain/entities/contacto.dart';

class ContactoLocalDataSource {
  final AppDatabase db; // conexión a la base de datos

  ContactoLocalDataSource(this.db);

  Future<List<Contacto>>  obtenerContactos() async {
    return await db.obtenerContactos();
  }

  Future<void> insertarContacto(Contacto c) async {
    await db.insertarContacto(c);
  }
}