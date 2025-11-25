import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/sintoma_provider.dart';

class TelaBExibicao extends StatelessWidget {
  const TelaBExibicao({super.key});

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<SintomaProvider>(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Tela B - Exibição do Sintoma'),
      ),
      body: Center(
        child: provider.sintomaSelecionado == null
            ? const Text(
          'Nenhum sintoma selecionado.',
          style: TextStyle(fontSize: 18),
        )
            : Text(
          'Sintoma selecionado:\n\n${provider.sintomaSelecionado}',
          textAlign: TextAlign.center,
          style: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}
