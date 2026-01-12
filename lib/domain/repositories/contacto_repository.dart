import '../entities/contacto.dart';

abstract class ContactoRepository {
  Future<List<Contacto>> obtenerContactos();
  Future<List<Contacto>> obtenerFavoritos();
  Future<Contacto> obtenerContactoPorId(int id);
  Future<void> agregarContacto(Contacto contacto);
  Future<bool> actualizarContacto(Contacto contacto);
  Future<bool> cambiarFavorito(int id, bool esFavorito);
  Future<int> eliminarContacto(int id);
}