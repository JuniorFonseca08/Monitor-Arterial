import 'package:controle_pressao_arterial/paginas/home/componentes/data/grafico_data.dart';
import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';

class LineGrafico extends StatelessWidget {
  final List<GraficoData> pontoMax;
  final List<GraficoData> pontoMin;

  const LineGrafico({
    super.key,
    required this.pontoMax,
    required this.pontoMin,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: AspectRatio(
        aspectRatio: 2.5,
        child: LineChart(
          LineChartData(
            backgroundColor: const Color.fromRGBO(174, 194, 182, 0.63),
            betweenBarsData: [
              BetweenBarsData(
                fromIndex: 0,
                toIndex: 1,
                color: const Color.fromRGBO(148, 175, 159, 1),
              )
            ],
            lineBarsData: [
              LineChartBarData(
                  isStrokeCapRound: true,
                  isCurved: true,
                  belowBarData: BarAreaData(show: false),
                  barWidth: 3,
                  color: Colors.amber,
                  spots: pontoMax
                      .map((point) => FlSpot(point.x, point.yMax))
                      .toList(),
                  dotData: const FlDotData(show: false)),
              LineChartBarData(
                isStrokeCapRound: true,
                isCurved: true,
                belowBarData: BarAreaData(show: false),
                barWidth: 3,
                color: Colors.blue,
                spots: pontoMin
                    .map((point) => FlSpot(point.x, point.yMin))
                    .toList(),
                dotData: const FlDotData(show: false),
              ),
            ],
            minY: 6,
            titlesData: const FlTitlesData(
              bottomTitles: AxisTitles(
                  sideTitles: SideTitles(showTitles: true, interval: 1)),
              leftTitles: AxisTitles(
                  sideTitles: SideTitles(
                      reservedSize: 25, showTitles: true, interval: 2)),
              topTitles: AxisTitles(sideTitles: SideTitles(showTitles: false)),
              rightTitles:
                  AxisTitles(sideTitles: SideTitles(showTitles: false)),
            ),
            borderData: FlBorderData(
                border: const Border(bottom: BorderSide(), left: BorderSide())),
            gridData: const FlGridData(show: false),
          ),
        ),
      ),
    );
  }
}
