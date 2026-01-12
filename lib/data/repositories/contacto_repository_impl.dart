import '../../domain/entities/contacto.dart';
import '../datasource/contacto_local_datasource.dart';
import '../../domain/repositories/contacto_repository.dart';

class ContactoRepositoryImpl implements ContactoRepository{
  final ContactoLocalDataSource local;
  ContactoRepositoryImpl(this.local);

  @override
  Future<void> agregarContacto(Contacto contacto) {
    return local.insertarContacto(contacto);
  }

  @override
  Future<List<Contacto>> obtenerFavoritos() {
   return local.obtenerFavoritos();
  }

  @override
  Future<List<Contacto>> obtenerContactos() {
    return local.obtenerContactos();
  }

  @override
  Future<Contacto> obtenerContactoPorId(int id) {
    return local.obtenerContactoPorId(id);
  }

  @override
  Future<bool> actualizarContacto(Contacto contacto) {
    return actualizarContacto(contacto);
  }

  @override
  Future<bool> cambiarFavorito(int id, bool esFavorito) {
    return local.cambiarFavorito(id, esFavorito);
  }

  @override
  Future<int> eliminarContacto(int id) {
    return local.eliminarContacto(id);
  }
}