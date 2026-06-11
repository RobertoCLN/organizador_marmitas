class Marmita {
  String id;
  String nome;
  String tipo;
  bool congelada;
  bool consumida;

  Marmita({
    required this.id,
    required this.nome,
    required this.tipo,
    required this.congelada,
    required this.consumida,
  });

  // Converter o objeto Marmita para um mapa JSON para usar o shared_preferences
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'nome': nome,
      'tipo': tipo,
      'congelada': congelada,
      'consumida': consumida,
    };
  }

  // Pega o Json e converte para um objeto Marmita
  factory Marmita.fromJson(Map<String, dynamic> json) {
    return Marmita(
      id: json['id'],
      nome: json['nome'],
      tipo: json['tipo'],
      congelada: json['congelada'] ?? false,
      consumida: json['consumida'] ?? false,
    );
  }
}
