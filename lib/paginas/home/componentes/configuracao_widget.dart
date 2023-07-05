import 'package:controle_pressao_arterial/entities/afazer_entity.dart';
import 'package:flutter/material.dart';
import 'package:uuid/uuid.dart';

import '../../../componentes/espacamento_componente.dart';

class ConfiguracaoWidget extends StatefulWidget {
  final void Function(AfazerEntity item) callback;

  const ConfiguracaoWidget({
    super.key,
    required this.callback,
  });

  @override
  State<ConfiguracaoWidget> createState() => _ConfiguracaoWidgetState();
}

class _ConfiguracaoWidgetState extends State<ConfiguracaoWidget> {
  final _formKey = GlobalKey<FormState>();
  final _nome = TextEditingController();
  final _idade = TextEditingController();
  final _pressaoPacienteMax = TextEditingController();
  final _pressaoPacienteMin = TextEditingController();
  final _riscoMax = TextEditingController();
  final _riscoMin = TextEditingController();

  void handleSubmit() {
    final item = AfazerEntity(
      uuid: const Uuid().v4(),
      nome: _nome.text,
      idade: _idade.text,
      data: DateTime.now(),
      pressaoPacienteMax: int.parse(_pressaoPacienteMax.text),
      pressaoPacienteMin: int.parse(_pressaoPacienteMin.text),
      pressaoRiscoMax: int.parse(_riscoMax.text),
      pressaoRiscoMin: int.parse(_riscoMin.text),
    );
    widget.callback(item);
    Navigator.pop(context);
  }

  @override
  void initState() {
    super.initState();
    _nome.text = '';
    _idade.text = '';
  }

  @override
  Widget build(BuildContext context) {
    return Form(
        key: _formKey,
        child: Column(
          children: [
            Text('Preencha seus dados'),
            const EspacamentoComponente(),
            Row(
              children: [
                Expanded(
                  child: SizedBox(
                    child: TextField(
                      controller: _nome,
                      decoration: const InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: 'Digite seu nome',
                          hintText: 'Ex. Junior Fonseca',
                          focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                            color: Colors.blueAccent,
                            width: 2,
                          ))),
                    ),
                  ),
                ),
                const EspacamentoComponente(size: 30, isHorizontal: true),
                Expanded(
                  child: SizedBox(
                    child: TextField(
                      controller: _idade,
                      decoration: const InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: 'Idade',
                          hintText: '00',
                          focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                            color: Colors.blueAccent,
                            width: 2,
                          ))),
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
                      controller: _pressaoPacienteMax,
                      decoration: const InputDecoration(
                          border: OutlineInputBorder(),
                          //labelText: 'Idade',
                          hintText: 'Maxima',
                          focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                            color: Colors.blueAccent,
                            width: 2,
                          ))),
                    ),
                  ),
                ),
                const EspacamentoComponente(size: 20, isHorizontal: true),
                Flexible(
                  child: SizedBox(
                    child: TextField(
                      controller: _pressaoPacienteMin,
                      decoration: const InputDecoration(
                          border: OutlineInputBorder(),
                          //labelText: 'Idade',
                          hintText: 'Minima',
                          focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                            color: Colors.blueAccent,
                            width: 2,
                          ))),
                    ),
                  ),
                ),
              ],
            ),
            EspacamentoComponente(),
            Row(
              children: [
                Text('Valor de Risco:'),
                EspacamentoComponente(isHorizontal: true, size: 16),
                Flexible(
                  child: SizedBox(
                    child: TextField(
                      controller: _riscoMax,
                      decoration: const InputDecoration(
                          border: OutlineInputBorder(),
                          //labelText: 'Idade',
                          hintText: 'Maxima',
                          focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                            color: Colors.blueAccent,
                            width: 2,
                          ))),
                    ),
                  ),
                ),
                const EspacamentoComponente(size: 30, isHorizontal: true),
                Flexible(
                  child: SizedBox(
                    child: TextField(
                      controller: _riscoMin,
                      decoration: const InputDecoration(
                          border: OutlineInputBorder(),
                          //labelText: 'Idade',
                          hintText: 'Minima',
                          focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                            color: Colors.blueAccent,
                            width: 2,
                          ))),
                    ),
                  ),
                ),
                const EspacamentoComponente(
                    size: 30, isHorizontal: true, isFull: true)
              ],
            ),
            EspacamentoComponente(),
            ElevatedButton(
              onPressed: handleSubmit,
              child: Text('Salvar'),
            ),
          ],
        ));
  }
}
