import 'package:controle_pressao_arterial/paginas/home/componentes/configuracao_widget.dart';
import 'package:flutter/material.dart';

import '../../../componentes/espacamento_componente.dart';

class HomeTab extends StatefulWidget {
  const HomeTab({super.key});

  @override
  State<HomeTab> createState() => _HomeTabState();
}

class _HomeTabState extends State<HomeTab> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(8),
      color: Colors.green,
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Card(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
            child: Row(
              children: [
                const CircleAvatar(
                  radius: 30,
                  child: Text('JR'),
                ),
                const EspacamentoComponente(size: 20, isHorizontal: true),
                const Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Junior Fonseca',
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.w800),
                      ),
                      Text(
                        '29 anos',
                        style: TextStyle(
                            fontSize: 14, fontWeight: FontWeight.w200),
                      ),
                    ]),
                const EspacamentoComponente(isFull: true),
                IconButton(
                  onPressed: () {
                    showDialog(
                        context: context,
                        builder: (context) {
                          return const SimpleDialog(
                            contentPadding: EdgeInsets.all(16),
                            children: [
                              ConfiguracaoWidget(),
                            ],
                          );
                        });
                  },
                  icon: const Icon(Icons.edit_note_rounded),
                )
              ],
            ),
          ),
        ),
        const EspacamentoComponente(),
        const Card(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 16, vertical: 16),
            child: Column(children: [
              Text('Controle de Pressão Arterial',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
              EspacamentoComponente(),
              Row(
                children: [
                  Text('Pressão do Paciente: '),
                  EspacamentoComponente(size: 20, isHorizontal: true),
                ],
              ),
              EspacamentoComponente(),
              Row(
                children: [
                  Text('Valor de Risco: '),
                  EspacamentoComponente(size: 60, isHorizontal: true),
                ],
              ),
              Divider(color: Colors.grey, thickness: 1),
              EspacamentoComponente(),
              Row(children: [
                Icon(Icons.list),
                SizedBox(width: 8),
                Text('Total de aferições: '),
              ]),
              EspacamentoComponente(),
              Row(children: [
                Icon(Icons.graphic_eq),
                SizedBox(width: 8),
                Text('Picos: '),
              ]),
            ]),
          ),
        ),
      ]),
    );
  }
}
