import 'dart:async';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class DBHelper {
  Future<Database> initDB() async {
    String path = await getDatabasesPath();
    String dbName = 'sintoma.db';
    String dbPath = join(path, dbName);

    var db = await openDatabase(dbPath, version: 2, onCreate: onCreate);
    return db;
  }

  Future<void> onCreate(Database db, int version) async {
    // Tabela Sintomas
    String sql = '''
    CREATE TABLE Sintoma (
      id INTEGER PRIMARY KEY AUTOINCREMENT,
      nome TEXT,
      icone TEXT,
      cor TEXT
    );
    ''';
    await db.execute(sql);

    await db.execute(
      "INSERT INTO Sintoma (nome, icone, cor ) VALUES ('Está tudo bem', 'thumb_up', 'yellow');",
    );
    await db.execute(
      "INSERT INTO Sintoma (nome, icone, cor) VALUES ('Dor de cabeça', 'face', 'orangeAccent');",
    );
    await db.execute(
      "INSERT INTO Sintoma (nome, icone, cor) VALUES ('Tosse', 'local_fire_department', 'pink');",
    );
    await db.execute(
      "INSERT INTO Sintoma (nome, icone, cor) VALUES ('Falta de ar', 'air', 'lightBlue');",
    );
    await db.execute(
      "INSERT INTO Sintoma (nome, icone, cor) VALUES ('Fadiga', 'bedtime', 'amber');",
    );
    await db.execute(
      "INSERT INTO Sintoma (nome, icone, cor) VALUES ('Fraqueza', 'fitness_center', 'blueAccent');",
    );
  }
}
