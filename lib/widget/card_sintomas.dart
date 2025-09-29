import 'package:sintomas_bd/db/sintoma_dao.dart';
import 'package:sintomas_bd/domain/sintomas.dart';
import 'package:flutter/material.dart';

class CardSintoma extends StatelessWidget {
  final Sintoma sintoma;
  final VoidCallback onDelete;

  const CardSintoma({Key? key, required this.sintoma, required this.onDelete})
    : super(key: key);

  @override
  Widget build(BuildContext context) {
    Color cor = _converterCor(sintoma.cor);
    SintomasDao sintomasDao = new SintomasDao();

    return Card(
      elevation: 1,
      margin: const EdgeInsets.symmetric(vertical: 8),
      child: ListTile(
        leading: Icon(_converterIcone(sintoma.icone), color: cor),
        title: Text(
          sintoma.nome,
          style: const TextStyle(fontWeight: FontWeight.bold),
        ),
        trailing: IconButton(
          icon: Icon(Icons.delete, color: Colors.red),
          onPressed:
              () => {
                sintomasDao.deletar(sintoma.id!),
                onDelete(),
                print('Sintoma deletado com sucesso!'),
              },
        ),
      ),
    );
  }

  IconData _converterIcone(String nomeIcone) {
    switch (nomeIcone) {
      case 'thumb_up':
        return Icons.thumb_up;
      case 'face':
        return Icons.face;
      case 'local_fire_department':
        return Icons.local_fire_department;
      case 'air':
        return Icons.air;
      case 'bedtime':
        return Icons.bedtime;
      case 'fitness_center':
        return Icons.fitness_center;
      default:
        return Icons.help;
    }
  }

  Color _converterCor(String nomeCor) {
    switch (nomeCor) {
      case 'yellow':
        return Colors.yellow;
      case 'orangeAccent':
        return Colors.orangeAccent;
      case 'pink':
        return Colors.pink;
      case 'lightBlue':
        return Colors.lightBlue;
      case 'amber':
        return Colors.amber;
      case 'blueAccent':
        return Colors.blueAccent;
      default:
        return Colors.grey;
    }
  }
}
