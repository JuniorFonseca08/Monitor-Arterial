class AfazerEntity {
  String uuid;
  String nome;
  String idade;
  DateTime data;
  int pressaoPacienteMax;
  int pressaoPacienteMin;
  int pressaoRiscoMax;
  int pressaoRiscoMin;
  int? pressaoMax;
  int? pressaoMin;

  AfazerEntity({
    required this.uuid,
    required this.nome,
    required this.idade,
    required this.data,
    required this.pressaoPacienteMax,
    required this.pressaoPacienteMin,
    required this.pressaoRiscoMax,
    required this.pressaoRiscoMin,
    this.pressaoMax,
    this.pressaoMin,
  });

  factory AfazerEntity.fronJson(Map<String, dynamic> json) {
    return AfazerEntity(
      uuid: json['uuid'],
      nome: json['nome'],
      idade: json['idade'],
      data: DateTime.fromMicrosecondsSinceEpoch(json['data']),
      pressaoPacienteMax: int.parse(json['pressaoPacienteMax']),
      pressaoPacienteMin: int.parse(json['pressaoPacienteMin']),
      pressaoRiscoMax: int.parse(json['pressaoRiscoMax']),
      pressaoRiscoMin: int.parse(json['pressaoRiscoMin']),
      pressaoMax: int.parse(json['pressaoMax']),
      pressaoMin: int.parse(json['pressaoMin']),
    );
  }

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

  static List<AfazerEntity> fromJsonList(List<dynamic>? json) {
    return json?.map((item) => AfazerEntity.fronJson(item)).toList() ?? [];
  }
}
