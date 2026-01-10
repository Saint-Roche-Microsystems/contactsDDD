import 'package:drift/drift.dart';
import 'package:drift_flutter/drift_flutter.dart';
import 'package:path_provider/path_provider.dart';
import '../schemas/contactos.schema.dart';
import '../../domain/entities/contacto.dart';

part 'app_database.g.dart';

@DriftDatabase(tables: [ContactosSchema])
class AppDatabase extends _$AppDatabase {
  AppDatabase() : super(_openConnection());

  @override
  int get schemaVersion => 2;

  /*=================*/
  /* Utilities */
  /*=================*/
  ContactosSchemaCompanion _toCompanion(Contacto c) {
    return ContactosSchemaCompanion(
      id: c.id != null ? Value(c.id!) : const Value.absent(),
      nombre: Value(c.nombre),
      descripcion: Value(c.descripcion),
      foto: Value(c.foto),
      correo: Value(c.correo),
      esFavorito: Value(c.esFavorito),
    );
  }

  ContactoData _toData(Contacto c) {
    if (c.id == null) {
      throw Exception('No se puede convertir un Contacto sin ID a ContactoData');
    }
    return ContactoData(
      id: c.id!,
      nombre: c.nombre,
      descripcion: c.descripcion,
      foto: c.foto,
      correo: c.correo,
      esFavorito: c.esFavorito,
    );
  }

  Contacto _toEntity(ContactoData data) {
    return Contacto(
      id: data.id,
      nombre: data.nombre,
      descripcion: data.descripcion,
      foto: data.foto,
      correo: data.correo,
      esFavorito: data.esFavorito,
    );
  }

  /*=================*/
  /* Operations */
  /*=================*/
  List<Contacto> _toEntityList(List<ContactoData> dataList) {
    return dataList.map(_toEntity).toList();
  }

  /* CRUD operations */
  Future<List<Contacto>> obtenerContactos() async {
    final queryResult = await select(contactosSchema).get();
    return _toEntityList(queryResult);
  }

  Future<void> insertarContacto(Contacto c) async {
    final companion = _toCompanion(c);
    await into(contactosSchema).insert(companion);
  }
}

QueryExecutor _openConnection() {
  return driftDatabase(
    name: 'contacts',
    native: const DriftNativeOptions(
      databaseDirectory: getApplicationDocumentsDirectory,
    ),
  );
}