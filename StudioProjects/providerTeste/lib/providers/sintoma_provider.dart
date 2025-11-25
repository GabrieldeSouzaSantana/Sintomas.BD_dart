import 'package:flutter/foundation.dart';
import 'package:providerteste/providers/sintoma_api.dart';

class SintomaProvider extends ChangeNotifier {
  String? _sintomaSelecionado;
  List<String> _sintomas = [];

  String? get sintomaSelecionado => _sintomaSelecionado;
  List<String> get sintomas => _sintomas;

  Future<void> carregarSintomas() async {
    try {
      _sintomas = (await SintomaApi().findAll())!.sintomas;
    } catch (error) {
      debugPrint('Erro ao buscar sintomas: $error');
      _sintomas = [
        "Erro ao carregar API",
        "Verifique a conexão ou servidor local",
      ];
    }

    notifyListeners();
  }

  void selecionarSintoma(String sintoma) {
    _sintomaSelecionado = sintoma;
    notifyListeners();
  }
}