import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

// crear, abrir y configurar la case de datos
class SQLiteService {
  static Future<Database> init() async {
    final path = join(await getDatabasesPath(), 'contactos.db');

    return openDatabase(
        path,
        version: 1,
        onCreate: (db,_) async{
          await db.execute(
              '''
          CREATE TABLE contactos(
            id INTEGER PRIMARY KEY AUTOINCREMENT,
            nombre TEXT,
            descripcion TEXT,
            foto TEXT
          )
          '''
          );
        }
    );
  }
}