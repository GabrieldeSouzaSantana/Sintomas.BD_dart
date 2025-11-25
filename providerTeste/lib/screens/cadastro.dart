import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:providerteste/screens/exibicao.dart';
import '../providers/sintoma_provider.dart';

class TelaACadastro extends StatefulWidget {
  const TelaACadastro({super.key});

  @override
  State<TelaACadastro> createState() => _TelaACadastroState();
}

class _TelaACadastroState extends State<TelaACadastro> {
  bool _isLoading = true;

  @override
  void initState() {
    super.initState();
    _carregarSintomas();
  }

  Future<void> _carregarSintomas() async {
    await Provider.of<SintomaProvider>(context, listen: false).carregarSintomas();
    setState(() => _isLoading = false);
  }

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<SintomaProvider>(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Tela A - Cadastro de Sintoma'),
      ),
      body: _isLoading
          ? const Center(child: CircularProgressIndicator())
          : ListView.builder(
        itemCount: provider.sintomas.length,
        itemBuilder: (ctx, i) {
          final sintoma = provider.sintomas[i];
          return ListTile(
            title: Text(sintoma),
            trailing: const Icon(Icons.arrow_forward_ios),
            onTap: () {
              provider.selecionarSintoma(sintoma);
              Navigator.push(
                context,
                MaterialPageRoute(builder: (_) => const TelaBExibicao()),
              );
            },
          );
        },
      ),
    );
  }
}
