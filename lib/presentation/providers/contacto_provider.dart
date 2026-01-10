import 'package:contactos/core/database/app_database.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../data/datasource/contacto_local_datasource.dart';
import '../../data/repositories/contacto_repository_impl.dart';
import '../../application/usecases/gestionar_contactos.dart';
import '../../domain/entities/contacto.dart';

/*=====================*/
/* Base Providers */
/*=====================*/

/// Database
final databaseProvider = Provider<AppDatabase>((ref) {
  return AppDatabase();
});

/// Local DataSource provider
final contactoDataSourceProvider = Provider<ContactoLocalDataSource>((ref) {
  final dbService = ref.watch(databaseProvider);
  return ContactoLocalDataSource(dbService);
});

/// Repository Provider
final contactoRepositoryProvider = Provider<ContactoRepositoryImpl>((ref) {
  final dataSource = ref.watch(contactoDataSourceProvider);
  return ContactoRepositoryImpl(dataSource);
});

/// UseCase Provider
final gestionarContactosProvider = Provider<GestionarContactos>((ref) {
  final repository = ref.watch(contactoRepositoryProvider);
  return GestionarContactos(repository);
});

/*=====================*/
/* State Providers */
/*=====================*/
final contactoProvider = StateNotifierProvider<ContactoNotifier, AsyncValue<List<Contacto>>>(
    (ref) {
      final usecase = ref.watch(gestionarContactosProvider);
      return ContactoNotifier(usecase);
    }
);

/*=====================*/
/* State Notifiers */
/*=====================*/
class ContactoNotifier extends StateNotifier<AsyncValue<List<Contacto>>> {
  final GestionarContactos _usecase;

  ContactoNotifier(this._usecase) : super(const AsyncValue.loading()) {
    cargar();
  }

  Future<void> cargar() async {
    state = const AsyncValue.loading();

    try {
      final contactos = await _usecase.listar();
      state = AsyncValue.data(contactos);
    } catch (e, st) {
      state = AsyncValue.error(e, st);
    }
  }

  Future<void> agregar(Contacto c) async {
    try {
      await _usecase.agregar(c);
      await cargar();
    } catch (e, st) {
      state = AsyncValue.error(e, st);
      rethrow;
    }
  }
}

