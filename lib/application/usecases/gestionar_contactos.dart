import '/../domain/entities/contacto.dart';
import '/../domain/repositories/contacto_repository.dart';

class GestionarContactos {
  final ContactoRepository repository;

  GestionarContactos(this.repository);

  Future<List<Contacto>> listar() => repository.obtenerContactos();
  Future<void> agregar(Contacto c) => repository.agregarContacto(c);
}