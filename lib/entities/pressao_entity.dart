class PressaoEntity {
  String comentario;
  int? pressaoMax;
  int? pressaoMin;
  DateTime? data;
  bool isChecked;
  

  PressaoEntity({
    required this.comentario,
     this.pressaoMax,
     this.pressaoMin,
     this.data,
    this.isChecked = false,
  });

  Map<String, dynamic> toJson() {
    return {
      'comentario': comentario,
      'pressaoMax': pressaoMax,
      'pressaoMin': pressaoMin,
      'data': data?.toIso8601String(),
      'isChecked': isChecked,
      
    };
  }

  factory PressaoEntity.fromJson(Map<String, dynamic> json) {
    return PressaoEntity(
      comentario: json['comentario'],
      pressaoMax: json['pressaoMax'],
      pressaoMin: json['pressaoMin'],
      data: DateTime.fromMicrosecondsSinceEpoch(json['data']),
      isChecked: json['isChecked']
    );
  }

  static List<PressaoEntity> fromJsonList(List<dynamic>? json) {
    return json?.map((e) => PressaoEntity.fromJson(e)).toList() ?? [];
  }
}