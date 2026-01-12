import '../entities/contacto.dart';

abstract class ContactoRepository {
  Future<List<Contacto>> obtenerContactos();
  Future<List<Contacto>> obtenerFavoritos();
  Future<void> agregarContacto(Contacto contacto);
}