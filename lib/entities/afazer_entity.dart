import 'package:controle_pressao_arterial/entities/pressao_entity.dart';

class AfazerEntity {
  String uuid;
  String? nome;
  int? idade;
  int? pressaoPacienteMax;
  int? pressaoPacienteMin;
  int? pressaoRiscoMax;
  int? pressaoRiscoMin;
  List<PressaoEntity> conteudos;
  String comentario;
  int? pressaoMax;
  int? pressaoMin;
  DateTime? data;

  AfazerEntity({
    required this.uuid,
    this.nome,
    this.idade,
    this.pressaoPacienteMax,
    this.pressaoPacienteMin,
    this.pressaoRiscoMax,
    this.pressaoRiscoMin,
    this.conteudos = const [],
    required this.comentario,
    this.pressaoMax,
    this.pressaoMin,
    this.data,
  });

  Map<String, dynamic> toJson() {
    return {
      'uuid': uuid,
      'nome': nome,
      'idade': idade,
      'pressaoPacienteMax': pressaoPacienteMax,
      'pressaoPacienteMin': pressaoPacienteMin,
      'pressaoRiscoMax': pressaoRiscoMax,
      'pressaoRiscoMin': pressaoPacienteMin,
      'conteudos': conteudos,
      'comentario': comentario,
      'pressaoMax': pressaoMax,
      'pressaoMin': pressaoMin,
      'data': data?.toIso8601String(),
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
      conteudos: PressaoEntity.fromJsonList(json['conteudos']),
      comentario: json['comentario'],
      pressaoMax: json['pressaoMax'],
      pressaoMin: json['pressaoMin'],
      data: json['data'] != null ? DateTime.parse(json['data']) : null,
    );
  }

  static List<Map<String, dynamic>> toJsonList(List<AfazerEntity> items) {
    return items.map((item) => item.toJson()).toList();
  }

  static List<AfazerEntity> fromJsonList(List<dynamic>? json) {
    return json?.map((item) => AfazerEntity.fromJson(item)).toList() ?? [];
  }
}
