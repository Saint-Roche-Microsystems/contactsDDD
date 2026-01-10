import 'package:drift/drift.dart';

@DataClassName('ContactoData')
class ContactosSchema extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get nombre => text().withLength(min: 1, max: 100)();
  TextColumn get descripcion => text()();
  TextColumn get foto => text()();
  TextColumn get correo => text().withLength(min: 1, max: 100)();
  BoolColumn get esFavorito => boolean().withDefault(const Constant(false))();
}