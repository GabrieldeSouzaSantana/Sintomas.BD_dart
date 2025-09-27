import 'package:sintomas_bd/domain/sintomas.dart';
import 'package:sqflite/sqlite_api.dart';

import 'db/database.dart';

class SintomasDao {
  Future<List<Sintoma>> listarSintomas() async {
    List<Sintoma> listaSintomas = [];
    Database db = await DBHelper().initDB();

    String sql = 'SELECT * FROM Sintoma;';
    var listResult = await db.rawQuery(sql);

    for (var json in listResult) {
      Sintoma sintoma = Sintoma.fromJson(json);
      listaSintomas.add(sintoma);
    }

    return listaSintomas;
  }
}
