class AfazerEntity {
  String uuid;
  String nome;
  int? idade;
  DateTime? data;
  int? pressaoPacienteMax;
  int? pressaoPacienteMin;
  int? pressaoRiscoMax;
  int? pressaoRiscoMin;
  int? pressaoMax;
  int? pressaoMin;

  AfazerEntity({
    required this.uuid,
    required this.nome,
    this.idade,
    this.data,
    this.pressaoPacienteMax,
    this.pressaoPacienteMin,
    this.pressaoRiscoMax,
    this.pressaoRiscoMin,
    this.pressaoMax,
    this.pressaoMin,
  });

  Map<String, dynamic> toJson() {
    return {
      'uuid': uuid,
      'nome': nome,
      'idade': idade,
      'data': data,
      'pressaoPacienteMax': pressaoPacienteMax,
      'pressaoPacienteMin': pressaoPacienteMin,
      'pressaoRiscoMax': pressaoRiscoMax,
      'pressaoRiscoMin': pressaoPacienteMin,
      'pressaoMax': pressaoMax,
      'pressaoMin': pressaoMin,
    };
  }

  factory AfazerEntity.fromJson(Map<String, dynamic> json) {
    return AfazerEntity(
      uuid: json['uuid'],
      nome: json['nome'],
      idade: json['idade'],
      data: DateTime.fromMicrosecondsSinceEpoch(json['data']),
      pressaoPacienteMax: json['pressaoPacienteMax'],
      pressaoPacienteMin: json['pressaoPacienteMin'],
      pressaoRiscoMax: json['pressaoRiscoMax'],
      pressaoRiscoMin: json['pressaoRiscoMin'],
      pressaoMax: json['pressaoMax'],
      pressaoMin: json['pressaoMin'],
    );
  }

 //static List<Map<String, dynamic>> toJsonList(List<AfazerEntity> items) {
 //  return items.map((item) => item.toJson()).toList();
 //}

  static List<AfazerEntity> fromJsonList(List<dynamic>? json) {
    return json?.map((item) => AfazerEntity.fromJson(item)).toList() ?? [];
  }
}
