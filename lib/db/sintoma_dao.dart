import 'package:sintomas_bd/db/database.dart';
import 'package:sintomas_bd/domain/sintomas.dart';
import 'package:sqflite/sqflite.dart';

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

  salvar(sintoma) async {
    Database db = await DBHelper().initDB();
    db.insert('Sintoma', sintoma.toJson());
  }

  deletar(int id) async {
    Database db = await DBHelper().initDB();
    db.delete('Sintoma', where: 'id = ?', whereArgs: [id]);
  }
}
