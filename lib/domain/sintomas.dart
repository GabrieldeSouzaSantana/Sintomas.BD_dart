class Sintoma {
  int? id;
  late String nome;
  late String icone;
  late String cor;

  Sintoma({
    this.id,
    required this.nome,
    required this.icone,
    required this.cor,
  });

  Sintoma.fromJson(Map<String, dynamic> json) {
      id = json['id'];
      nome = json['nome'];
      icone = json['icone'];
      cor = json['cor'];
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'nome': nome,
      'icone': icone,
      'cor': cor,
    };
  }
}
