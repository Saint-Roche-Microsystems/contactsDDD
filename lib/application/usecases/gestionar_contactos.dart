import '/../domain/entities/contacto.dart';
import '/../domain/repositories/contacto_repository.dart';

class GestionarContactos {
  final ContactoRepository repository;

  GestionarContactos(this.repository);

  Future<List<Contacto>> listar() => repository.obtenerContactos();
  Future<List<Contacto>> listarFavoritos() => repository.obtenerFavoritos();
  Future<Contacto> mostrarContacto(int id) => repository.obtenerContactoPorId(id);
  Future<void> agregar(Contacto c) => repository.agregarContacto(c);
  Future<bool> actualizar(Contacto c) => repository.actualizarContacto(c);
  Future<void> cambiarFavorito(int id, bool esFavorito) => repository.cambiarFavorito(id, esFavorito);
  Future<int> eliminar(int id) => repository.eliminarContacto(id);
}