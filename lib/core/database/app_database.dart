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
  int get schemaVersion => 3;

  /*=================*/
  /* Utilities */
  /*=================*/

  /// From Contacto (entity) ---> ContactosSchemaCompanion (Drift)
  ContactosSchemaCompanion _toCompanion(Contacto c) {
    return ContactosSchemaCompanion(
      id: c.id != null ? Value(c.id!) : const Value.absent(),
      nombre: Value(c.nombre),
      descripcion: Value(c.descripcion),
      foto: Value(c.foto),
      correo: Value(c.correo),
      telefono: Value(c.telefono),
      esFavorito: Value(c.esFavorito),
    );
  }

  /// From Contacto (entity) ---> ContactoData (Drift)
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
      telefono: c.telefono,
      esFavorito: c.esFavorito,
    );
  }

  /// From ContactoData (Drift) ---> Contacto (entity)
  Contacto _toEntity(ContactoData data) {
    return Contacto(
      id: data.id,
      nombre: data.nombre,
      descripcion: data.descripcion,
      foto: data.foto,
      correo: data.correo,
      telefono: data.telefono,
      esFavorito: data.esFavorito,
    );
  }

  List<Contacto> _toEntityList(List<ContactoData> dataList) {
    return dataList.map(_toEntity).toList();
  }

  /*=================*/
  /* Operations */
  /*=================*/
  /* CRUD operations */
  Future<List<Contacto>> obtenerContactos() async {
    final queryResult = await (select(contactosSchema)
          ..orderBy([(tbl) => OrderingTerm(expression: tbl.nombre, mode: OrderingMode.asc)]))
        .get();
    return _toEntityList(queryResult);
  }

  Future<List<Contacto>> obtenerFavoritos() async {
    final queryResult = await (select(contactosSchema)
          ..where((tbl) => tbl.esFavorito.equals(true))
          ..orderBy([(tbl) => OrderingTerm(expression: tbl.nombre, mode: OrderingMode.asc)]))
        .get();
    return _toEntityList(queryResult);
  }

  Future<Contacto> obtenerContacto(int id) async {
    final queryResult = await (select(contactosSchema)
          ..where((tbl) => tbl.id.equals(id)))
        .getSingle();
    return _toEntity(queryResult);
  }

  Future<void> insertarContacto(Contacto c) async {
    final companion = _toCompanion(c);
    await into(contactosSchema).insert(companion);
  }

  Future<bool> actualizarContacto(Contacto c) async {
    final data = _toData(c);
    final rowsAffected = await update(contactosSchema).replace(data);
    return rowsAffected;
  }

  Future<bool> toggleFavorito(int id, bool esFavorito) async {
    final rowsAffected = await (update(contactosSchema)
          ..where((tbl) => tbl.id.equals(id)))
        .write(ContactosSchemaCompanion(
      esFavorito: Value(esFavorito),
    ));
    return rowsAffected > 0;
  }

  Future<int> eliminarContacto(int id) async {
    final rowsDeleted = await (delete(contactosSchema)
          ..where((tbl) => tbl.id.equals(id)))
        .go();
    return rowsDeleted;
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