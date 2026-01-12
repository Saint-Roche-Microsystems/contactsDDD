import '../../core/database/app_database.dart';
import '../../domain/entities/contacto.dart';

class ContactoLocalDataSource {
  final AppDatabase db; // conexión a la base de datos

  ContactoLocalDataSource(this.db);

  Future<List<Contacto>> obtenerContactos() async {
    return await db.obtenerContactos();
  }

  Future<List<Contacto>> obtenerFavoritos() async {
    return await db.obtenerFavoritos();
  }

  Future<Contacto> obtenerContactoPorId(int id) async {
    return await db.obtenerContacto(id);
  }

  Future<void> insertarContacto(Contacto c) async {
    await db.insertarContacto(c);
  }

  Future<bool> actualizarContacto(Contacto c) async {
    return await db.actualizarContacto(c);
  }

  Future<bool> cambiarFavorito(int id, bool esFavorito) async {
    return await db.toggleFavorito(id, esFavorito);
  }

  Future<int> eliminarContacto(int id) async {
    return await db.eliminarContacto(id);
  }
}