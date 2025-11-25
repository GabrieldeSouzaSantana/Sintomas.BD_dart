class Sintoma {
  final List<String> sintomas;

  Sintoma({required this.sintomas});

  factory Sintoma.fromJson(Map<String, dynamic> json) {
    return Sintoma(
      sintomas: List<String>.from(json['sintomas']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'sintomas': sintomas,
    };
  }
}
