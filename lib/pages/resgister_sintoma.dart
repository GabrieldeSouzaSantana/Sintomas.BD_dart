import 'package:flutter/material.dart';
import 'package:sintomas_bd/db/sintoma_dao.dart';
import 'package:sintomas_bd/domain/sintomas.dart';
import 'package:sintomas_bd/pages/home_page.dart';

class RegisterSintoma extends StatefulWidget {
  const RegisterSintoma({super.key});

  @override
  State<RegisterSintoma> createState() => _RegisterSintomaState();
}

class _RegisterSintomaState extends State<RegisterSintoma> {
  TextEditingController nomeController = TextEditingController();
  TextEditingController iconeController = TextEditingController();
  TextEditingController corController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          leading: IconButton(
            onPressed: () => {Navigator.pop(context)},
            icon: Icon(Icons.arrow_back),
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.all(32),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text(
                'Registre um sintoma',
                style: TextStyle(fontSize: 21, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 24),
              TextField(
                controller: nomeController,
                decoration: InputDecoration(
                  hintText: 'Nome',
                  focusedBorder: buildUserOutlineInputBorder(),
                  border: buildUserOutlineInputBorder(),
                ),
              ),
              SizedBox(height: 16),
              TextField(
                controller: iconeController,
                obscureText: true,
                decoration: InputDecoration(
                  hintText: 'Ícone',
                  focusedBorder: buildUserOutlineInputBorder(),
                  border: buildUserOutlineInputBorder(),
                ),
              ),
              SizedBox(height: 16),
              TextField(
                controller: corController,
                obscureText: true,
                decoration: InputDecoration(
                  hintText: 'cor',
                  focusedBorder: buildUserOutlineInputBorder(),
                  border: buildUserOutlineInputBorder(),
                ),
              ),
              SizedBox(height: 24),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Color(0xFFE41D56),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8), // <-- Radius
                  ),
                ),
                onPressed: onPressed,
                child: Text(
                  'Registrar',
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w600,
                    fontSize: 16,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future<void> onPressed() async {
    String nome = nomeController.text;
    String icone = iconeController.text;
    String cor = corController.text;

    if (nome.isNotEmpty && icone.isNotEmpty && cor.isNotEmpty) {
      Sintoma sintoma = Sintoma(nome: nome, icone: icone, cor: cor);
      await SintomasDao().salvar(sintoma);

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Sintoma registrado com sucesso!'),
          backgroundColor: Colors.green,
          duration: Duration(seconds: 2),
        ),
      );

      Navigator.pop(context);
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Por favor, preencha todos os campos!'),
          backgroundColor: Colors.red,
          duration: Duration(seconds: 2),
        ),
      );
    }
  }

  OutlineInputBorder buildUserOutlineInputBorder() {
    return OutlineInputBorder(
      borderSide: BorderSide(color: Colors.grey),
      borderRadius: BorderRadius.vertical(top: Radius.circular(8)),
    );
  }
}
