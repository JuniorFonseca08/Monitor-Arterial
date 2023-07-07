import 'package:collection/collection.dart';

import '../../../../entities/afazer_entity.dart';

class GraficoData {
  final double x;
  final double yMax;
  final double yMin;
  final double yFixo;
  GraficoData({
    required this.x,
    required this.yMax,
    required this.yMin,
    required this.yFixo,
  });
}

List<GraficoData> getChartData(
    List<AfazerEntity> listaAfazeres, AfazerEntity afazerEntity) {
  final reversedList = listaAfazeres.reversed.toList();

  return reversedList.mapIndexed((index, element) {
    final yMax = element.pressaoMax?.toDouble() ?? 0;
    final yMin = element.pressaoMin?.toDouble() ?? 0;
    final yFixo = afazerEntity.pressaoPacienteMax?.toDouble() ?? 0;
    return GraficoData(
        x: index.toDouble() + 1, yMax: yMax, yMin: yMin, yFixo: yFixo);
  }).toList();
}
