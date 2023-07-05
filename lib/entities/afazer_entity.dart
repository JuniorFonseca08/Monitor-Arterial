
import 'package:controle_pressao_arterial/entities/pressao_entity.dart';

class AfazerEntity {
  String uuid;
  String nome;
  int idade;
  int pressaoPacienteMax;
  int pressaoPacienteMin;
  int pressaoRiscoMax;
  int pressaoRiscoMin;
  List<PressaoEntity> conteudos;

  AfazerEntity({
    required this.uuid,
    required this.nome,
    required this.idade,
    required this.pressaoPacienteMax,
    required this.pressaoPacienteMin,
    required this.pressaoRiscoMax,
    required this.pressaoRiscoMin,
    this.conteudos = const [],
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
    );
  }

 //static List<Map<String, dynamic>> toJsonList(List<AfazerEntity> items) {
 //  return items.map((item) => item.toJson()).toList();
 //}

  static List<AfazerEntity> fromJsonList(List<dynamic>? json) {
    return json?.map((item) => AfazerEntity.fromJson(item)).toList() ?? [];
  }
}
