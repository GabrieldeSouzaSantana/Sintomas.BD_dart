import 'package:sintomas_bd/sintoma_functions.dart';
import 'package:sintomas_bd/db/sintoma_dao.dart';
import 'package:flutter/material.dart';
import 'package:sintomas_bd/domain/sintomas.dart';

class SintomasPage extends StatelessWidget {
  const SintomasPage({super.key});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<Sintoma>>(
      future: SintomasDao().listarSintomas(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(child: CircularProgressIndicator());
        }
        if (snapshot.hasError) {
          return Center(child: Text("Erro: ${snapshot.error}"));
        }
        if (!snapshot.hasData || snapshot.data!.isEmpty) {
          return const Center(child: Text("Nenhum sintoma cadastrado"));
        }

        final sintomas = snapshot.data!;

        return Scaffold(
          appBar: AppBar(title: Text("Sintomas"), backgroundColor: Colors.pink),
          body: Padding(
            padding: const EdgeInsets.all(16),
            child: Wrap(
              spacing: 10,
              runSpacing: 10,
              children:
                  sintomas.map((s) {
                    return SintomaButton(
                      icon: s.iconData,
                      label: s.nome,
                      color: s.colorData,
                    );
                  }).toList(),
            ),
          ),
        );
      },
    );
  }
}

class SintomaButton extends StatelessWidget {
  final IconData icon;
  final String label;
  final Color color;

  const SintomaButton({
    super.key,
    required this.icon,
    required this.label,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 8),
      decoration: BoxDecoration(
        color: Colors.pink.shade100,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(icon, size: 24, color: color),
          const SizedBox(width: 8),
          Text(label, style: const TextStyle(fontWeight: FontWeight.w500)),
        ],
      ),
    );
  }
}
