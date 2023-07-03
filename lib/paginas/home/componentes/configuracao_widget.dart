import 'package:flutter/material.dart';

import '../../../componentes/espacamento_componente.dart';

class ConfiguracaoWidget extends StatefulWidget {
  const ConfiguracaoWidget({super.key});

  @override
  State<ConfiguracaoWidget> createState() => _ConfiguracaoWidgetState();
}

class _ConfiguracaoWidgetState extends State<ConfiguracaoWidget> {
  final _formKey = GlobalKey<FormState>();

  final TextEditingController nomePaciente = TextEditingController();
  final TextEditingController idadePaciente = TextEditingController();

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
    return Form(
        key: _formKey,
        child: Column(
          children: [
            const Row(
              children: [
                Text('Nome do Paciente:'),
                EspacamentoComponente(isFull: true),
                Text('Idade do Paciente:'),
              ],
            ),
            const EspacamentoComponente(),
            Row(
              children: [
                Flexible(
                  child: SizedBox(
                    child: TextField(
                      controller: nomePaciente,
                      decoration: InputDecoration(hintText: 'Digite seu nome'),
                    ),
                  ),
                ),
                const EspacamentoComponente(isFull: true),
                Flexible(
                  child: SizedBox(
                    width: 50,
                    child: TextField(
                      controller: idadePaciente,
                      decoration: InputDecoration(hintText: 'Idade'),
                    ),
                  ),
                ),
              ],
            ),
            const EspacamentoComponente(),
            Row(
              children: [
                Text('Pressao do Paciente:'),
                EspacamentoComponente(isHorizontal: true, size: 8),
                Flexible(
                  child: SizedBox(
                    //width: 50,
                    //height: 20,
                    child: TextField(
                      controller: pressaoPacienteMax,
                      decoration: InputDecoration(hintText: 'Maxima'),
                    ),
                  ),
                ),
                const EspacamentoComponente(size: 20, isHorizontal: true),
                Flexible(
                  child: SizedBox(
                    child: TextField(
                      controller: pressaoPacienteMin,
                      decoration: InputDecoration(hintText: 'Minima'),
                    ),
                  ),
                ),
              ],
            ),
            Row(
              children: [
                Text('Valor de Risco:'),
                EspacamentoComponente(isHorizontal: true, size: 16),
                Flexible(
                  child: SizedBox(
                    child: TextField(
                      controller: riscoMax,
                      decoration: InputDecoration(hintText: 'Maxima'),
                    ),
                  ),
                ),
                const EspacamentoComponente(size: 30, isHorizontal: true),
                Flexible(
                  child: SizedBox(
                    child: TextField(
                      controller: riscoMin,
                      decoration: InputDecoration(hintText: 'Minima'),
                    ),
                  ),
                ),
                const EspacamentoComponente(
                    size: 30, isHorizontal: true, isFull: true)
              ],
            ),
            EspacamentoComponente(),
            ElevatedButton(
              onPressed: () {},
              child: Text('Salvar'),
            ),
          ],
        ));
  }
}
