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
  late Future<List<Sintoma>> futureSintomas;

  @override
  void initState() {
    super.initState();
    futureSintomas = SintomasDao().listarSintomas();
  }

  Future<void> loadData() async {
    setState(() {
      futureSintomas = SintomasDao().listarSintomas();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(16.0),
      child: FutureBuilder<List<Sintoma>>(
        future: futureSintomas,
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return Center(child: CircularProgressIndicator());
          }

          final listaSintomas = snapshot.requireData;
          if (listaSintomas.isEmpty) {
            return Center(child: Text("Não há sintomas registrados!"));
          }

          return buildListView(listaSintomas);
        },
      ),
    );
  }

  buildListView(listaSintomas) {
    return ListView.builder(
      itemCount: listaSintomas.length,
      itemBuilder: (context, i) {
        return CardSintoma(
          sintoma: listaSintomas[i],
          onDelete: () => loadData(),
        );
      },
    );
  }
}
