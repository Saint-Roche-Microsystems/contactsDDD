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
}