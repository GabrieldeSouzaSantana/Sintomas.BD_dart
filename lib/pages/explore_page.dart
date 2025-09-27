import 'package:sintomas_bd/domain/sintomas.dart';
import 'package:sintomas_bd/widget/card_sintomas.dart';
import 'package:sintomas_bd/db/sintoma_dao.dart';
import 'package:flutter/material.dart';

class ExplorePage extends StatefulWidget {
  const ExplorePage({super.key});

  @override
  State<ExplorePage> createState() => _ExplorePageState();
}

class _ExplorePageState extends State<ExplorePage> {
  List<Sintoma> listaSintoma = [];

  @override
  void initState() {
    super.initState();
    loadData();
  }

  Future<void> loadData() async {
    listaSintoma = await SintomasDao().listarSintomas();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(16.0),
      child:
          listaSintoma.isEmpty
              ? Center(
                child:
                    listaSintoma == null
                        ? CircularProgressIndicator()
                        : Text("Não há sintoma registrado!"),
              )
              : ListView.builder(
                itemCount: listaSintoma.length,
                itemBuilder: (context, i) {
                  return CardSintoma(
                    sintoma: listaSintoma[i],
                    onDelete: () async {
                      await loadData();
                    },
                  );
                },
              ),
    );
  }
}
