import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../core/database/sqlite_service.dart';
import '../../data/datasource/contacto_local_datasource.dart';
import '../../data/repositories/contacto_repository_impl.dart';
import '../../application/usecases/gestionar_contactos.dart';
import '../../domain/entities/contacto.dart';

/* Definir el provider */
final contactoProvider = StateNotifierProvider<ContactoNotifier, AsyncValue<List<Contacto>>>(
    (ref) => ContactoNotifier(),
);

class ContactoNotifier extends StateNotifier<AsyncValue<List<Contacto>>> {
  ContactoNotifier(): super(AsyncLoading()) {
    cargar();
  }
  late GestionarContactos usecase;

  Future<void> cargar() async {
    final db = await SQLiteService.init();
    usecase = GestionarContactos(
      ContactoRepositoryImpl(
        ContactoLocalDataSource(db),
      ),
    );

    state = AsyncData(await usecase.listar());
  }

  Future<void> agregar(Contacto c) async {
    await usecase.agregar(c);
    cargar();
  }
}

