class AfazerEntity {
  String uuid;
  String? nome;
  int? idade;
  int? pressaoPacienteMax;
  int? pressaoPacienteMin;
  int? pressaoRiscoMax;
  int? pressaoRiscoMin;
  String comentario;
  int? pressaoMax;
  int? pressaoMin;
  DateTime? data;
  String? imagem;

  AfazerEntity(
      {required this.uuid,
      this.nome,
      this.idade,
      this.pressaoPacienteMax,
      this.pressaoPacienteMin,
      this.pressaoRiscoMax,
      this.pressaoRiscoMin,
      required this.comentario,
      this.pressaoMax,
      this.pressaoMin,
      this.data,
      this.imagem});

  Map<String, dynamic> toJson() {
    return {
      'uuid': uuid,
      'nome': nome,
      'idade': idade,
      'pressaoPacienteMax': pressaoPacienteMax,
      'pressaoPacienteMin': pressaoPacienteMin,
      'pressaoRiscoMax': pressaoRiscoMax,
      'pressaoRiscoMin': pressaoPacienteMin,
      'comentario': comentario,
      'pressaoMax': pressaoMax,
      'pressaoMin': pressaoMin,
      'data': data?.toIso8601String(),
      if (imagem != null) 'imagem': imagem,
    };
  }

  factory AfazerEntity.fromJson(Map<String, dynamic> json) {
    return AfazerEntity(
      uuid: json['uuid'],
      nome: json['nome'],
      idade: json['idade'],
      pressaoPacienteMax: json['pressaoPacienteMax'],
      pressaoPacienteMin: json['pressaoPacienteMin'],
      pressaoRiscoMax: json['pressaoRiscoMax'],
      pressaoRiscoMin: json['pressaoRiscoMin'],
      comentario: json['comentario'],
      pressaoMax: json['pressaoMax'],
      pressaoMin: json['pressaoMin'],
      data: json['data'] != null ? DateTime.parse(json['data']) : null,
      imagem: json['imagem'],
    );
  }

  static List<Map<String, dynamic>> toJsonList(List<AfazerEntity> items) {
    return items.map((item) => item.toJson()).toList();
  }

  static List<AfazerEntity> fromJsonList(List<dynamic>? json) {
    return json?.map((item) => AfazerEntity.fromJson(item)).toList() ?? [];
  }
}
