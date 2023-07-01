import 'package:flutter/material.dart';

import '../../../componentes/espacamento_componente.dart';

class HomeTab extends StatefulWidget {
  const HomeTab({super.key});

  @override
  State<HomeTab> createState() => _HomeTabState();
}

class _HomeTabState extends State<HomeTab> {
  final TextEditingController pressaoPacienteMax = TextEditingController();
  final TextEditingController pressaoPacienteMin = TextEditingController();

  final TextEditingController riscoMax = TextEditingController();
  final TextEditingController riscoMin = TextEditingController();

  @override
  void dispose() {
    pressaoPacienteMin.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        const Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CircleAvatar(
              radius: 30,
              child: Text('JR'),
            ),
            EspacamentoComponente(
              size: 20,
              isHorizontal: true,
            ),
            Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Text('Junior Fonseca',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.w800)),
              Text('29 anos',
                  style: TextStyle(fontSize: 14, fontWeight: FontWeight.w200)),
            ])
          ],
        ),
        const EspacamentoComponente(),
        Card(
          margin: const EdgeInsets.all(0),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
            child: Column(
              children: [
                const Text('Controle de Pressão Arterial',
                    style:
                        TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                const EspacamentoComponente(),
                Row(
                  children: [
                    const Text('Pressão do Paciente: '),
                    const EspacamentoComponente(size: 20, isHorizontal: true),
                    Flexible(
                      child: SizedBox(
                        width: 50,
                        height: 30,
                        child: TextField(
                          cursorHeight: 20,
                          controller: pressaoPacienteMax,
                        ),
                      ),
                    ),
                    const EspacamentoComponente(size: 20, isHorizontal: true),
                    Flexible(
                      child: SizedBox(
                        width: 50,
                        height: 30,
                        child: TextField(
                          controller: pressaoPacienteMin,
                        ),
                      ),
                    ),
                    const EspacamentoComponente(
                        size: 30, isHorizontal: true, isFull: true),
                  ],
                ),
                const EspacamentoComponente(),
                Row(
                  children: [
                    const Text('Valor de Risco: '),
                    const EspacamentoComponente(size: 60, isHorizontal: true),
                    Flexible(
                      child: SizedBox(
                        width: 50,
                        height: 30,
                        child: TextField(
                          controller: riscoMax,
                        ),
                      ),
                    ),
                    const EspacamentoComponente(size: 20, isHorizontal: true),
                    Flexible(
                      child: SizedBox(
                        width: 50,
                        height: 30,
                        child: TextField(
                          controller: riscoMin,
                        ),
                      ),
                    ),
                    const EspacamentoComponente(
                        size: 30, isHorizontal: true, isFull: true)
                  ],
                ),
                const Divider(color: Colors.grey, thickness: 1),
                const EspacamentoComponente(),
                Row(children: [
                  const Icon(Icons.list),
                  const SizedBox(width: 8),
                  const Text('Total de aferições: '),
                ]),
                const EspacamentoComponente(),
                Row(children: [
                  const Icon(Icons.graphic_eq),
                  const SizedBox(width: 8),
                  const Text('Picos: '),
                ]),
              ],
            ),
          ),
        ),
      ]),
    );
  }
}
