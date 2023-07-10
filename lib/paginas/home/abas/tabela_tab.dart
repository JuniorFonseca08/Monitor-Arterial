import 'package:controle_pressao_arterial/providers/afazer_provider.dart';
import 'package:flutter/material.dart';
import 'package:controle_pressao_arterial/entities/afazer_entity.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

import '../../../componentes/espacamento_componente.dart';
import '../componentes/data/grafico_data.dart';
import '../componentes/grafico/line_grafico.dart';

class TabelaPage extends StatefulWidget {
  final List<AfazerEntity> dados;
  final String? foto;
  final String? nome;
  final int? idade;

  const TabelaPage({
    Key? key,
    required this.dados,
    this.foto,
    this.nome,
    this.idade,
  }) : super(key: key);

  @override
  _TabelaPageState createState() => _TabelaPageState();
}

class _TabelaPageState extends State<TabelaPage> {
  late AfazerProvider store;

  @override
  Widget build(BuildContext context) {
    store = Provider.of<AfazerProvider>(context);
    final afazerEntity = Provider.of<AfazerProvider>(context).afazerEntity;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Tabela de Dados'),
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const EspacamentoComponente(size: 16),
            const Text(
              'Monitoramento da \n  Pressão Arterial',
              style: TextStyle(
                fontSize: 25,
                fontWeight: FontWeight.bold,
              ),
            ),
            const EspacamentoComponente(size: 20),
            Padding(
              padding: const EdgeInsets.all(10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Text('Paciente: ${store.afazerEntity.nome}',
                      style: const TextStyle(fontSize: 18)),
                  const EspacamentoComponente(),
                  Text('Idade: ${store.afazerEntity.idade ?? ''}',
                      style: const TextStyle(fontSize: 18)),
                ],
              ),
            ),
            const EspacamentoComponente(size: 5),
            LineGrafico(
              pontoMax: getChartData(store.listaAfazeres, afazerEntity),
              pontoMin: getChartData(store.listaAfazeres, afazerEntity),
            ),
            const EspacamentoComponente(size: 20),
            FittedBox(
              fit: BoxFit.fitHeight,
              child: DataTable(
                dataTextStyle: const TextStyle(fontSize: 20),
                headingTextStyle: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
                columns: const [
                  DataColumn(label: Text('Data')),
                  DataColumn(label: Text('Máxima')),
                  DataColumn(label: Text('Mínima')),
                  DataColumn(label: Text('Comentário')),
                ],
                rows: widget.dados.map((afazer) {
                  String dataHoraFormatada =
                      DateFormat('dd-MM-yyyy - HH:mm').format(afazer.data!);
                  return DataRow(cells: [
                    DataCell(Text(dataHoraFormatada)),
                    DataCell(Text(afazer.pressaoMax.toString())),
                    DataCell(Text(afazer.pressaoMin.toString())),
                    DataCell(Text(afazer.comentario))
                  ]);
                }).toList(),
              ),
            ),
            const EspacamentoComponente(size: 20),
          ],
        ),
      ),
    );
  }
}
