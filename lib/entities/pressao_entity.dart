class PressaoEntity {
  String comentario;
  int? pressaoMax;
  int? pressaoMin;

  PressaoEntity({
    required this.comentario,
    this.pressaoMax,
    this.pressaoMin,
  });

  Map<String, dynamic> toJson() {
    return {
      'comentario': comentario,
      'pressaoMax': pressaoMax,
      'pressaoMin': pressaoMin,
    };
  }

  factory PressaoEntity.fromJson(Map<String, dynamic> json) {
    return PressaoEntity(
      comentario: json['comentario'],
      pressaoMax: json['pressaoMax'],
      pressaoMin: json['pressaoMin'],
    );
  }

  static List<PressaoEntity> fromJsonList(List<dynamic>? json) {
    return json?.map((e) => PressaoEntity.fromJson(e)).toList() ?? [];
  }
}
