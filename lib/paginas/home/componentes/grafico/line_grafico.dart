import 'package:controle_pressao_arterial/paginas/home/componentes/data/grafico_data.dart';
import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';

class LineGrafico extends StatelessWidget {
  final List<GraficoData> pontoMax;
  final List<GraficoData> pontoMin;
  final List<GraficoData> pontoFixo;

  const LineGrafico(
      {super.key,
      required this.pontoMax,
      required this.pontoMin,
      required this.pontoFixo});

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 2.5,
      child: LineChart(LineChartData(
        lineBarsData: [
          LineChartBarData(
              isStrokeCapRound: true,
              isCurved: true,
              belowBarData: BarAreaData(show: false),
              barWidth: 5,
              color: Colors.amber,
              spots:
                  pontoMax.map((point) => FlSpot(point.x, point.yMax)).toList(),
              dotData: FlDotData(show: true)),
          LineChartBarData(
            isStrokeCapRound: true,
            isCurved: true,
            belowBarData: BarAreaData(show: false),
            barWidth: 5,
            color: Colors.blue,
            spots:
                pontoMin.map((point) => FlSpot(point.x, point.yMin)).toList(),
            dotData: FlDotData(show: true),
          ),
          LineChartBarData(
            isStrokeCapRound: true,
            isCurved: true,
            belowBarData: BarAreaData(show: false),
            barWidth: 5,
            color: Colors.red,
            spots:
                pontoFixo.map((point) => FlSpot(point.x, point.yFixo)).toList(),
            dotData: FlDotData(show: true),
          )
        ],
        minY: 0,
        titlesData: FlTitlesData(show: true),
        borderData: FlBorderData(show: true),
        gridData: FlGridData(show: true),
      )),
    );
  }
}
