import '../entities/contacto.dart';

abstract class ContactoRepository {
  Future<List<Contacto>> obtenerContactos();
  Future<void> agregarContacto(Contacto contacto);
}