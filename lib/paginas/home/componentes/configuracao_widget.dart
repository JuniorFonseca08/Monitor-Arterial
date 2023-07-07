import 'package:controle_pressao_arterial/entities/afazer_entity.dart';
import 'package:controle_pressao_arterial/providers/config_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
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
  late ConfigProvider storeConfig;

  void handleSubmit() {
    if (_nome.text.isEmpty ||
        _idade.text.isEmpty ||
        _pressaoPacienteMax.text.isEmpty ||
        _pressaoPacienteMin.text.isEmpty ||
        _riscoMax.text.isEmpty ||
        _riscoMin.text.isEmpty) {
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: const Text('Erro',
                style: TextStyle(fontWeight: FontWeight.bold)),
            content: const Text('Por favor, preencha todos os campos.'),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: const Text('OK'),
              ),
            ],
          );
        },
      );
    } else {
      final item = AfazerEntity(
        uuid: const Uuid().v4(),
        nome: _nome.text,
        idade: int.parse(_idade.text),
        pressaoPacienteMax: int.parse(_pressaoPacienteMax.text),
        pressaoPacienteMin: int.parse(_pressaoPacienteMin.text),
        pressaoRiscoMax: int.parse(_riscoMax.text),
        pressaoRiscoMin: int.parse(_riscoMin.text),
        comentario: '',
      );
      widget.callback(item);
      Navigator.pop(context);
    }
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    storeConfig = Provider.of<ConfigProvider>(context);
    return Padding(
      padding: const EdgeInsets.all(10),
      child: Form(
        key: _formKey,
        child: Column(
          children: [
            const Text(
              'Preencha seus dados:',
              style: TextStyle(fontWeight: FontWeight.w600),
            ),
            const EspacamentoComponente(),
            Row(
              children: [
                Expanded(
                  flex: 3,
                  child: SizedBox(
                    child: TextField(
                      controller: _nome,
                      decoration: const InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: 'Digite seu nome',
                          hintText: 'Ex. Junior Fonseca',
                          focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                            width: 2,
                          ))),
                    ),
                  ),
                ),
                const EspacamentoComponente(size: 30, isHorizontal: true),
                Flexible(
                  flex: 1,
                  child: SizedBox(
                    width: 100,
                    child: TextField(
                      controller: _idade,
                      decoration: const InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: 'Idade',
                          hintText: 'Ex: 20',
                          focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                            width: 2,
                          ))),
                    ),
                  ),
                ),
              ],
            ),
            const EspacamentoComponente(),
            const Text('Pressao Arterial Desejada:',
                style: TextStyle(fontWeight: FontWeight.w600)),
            const EspacamentoComponente(),
            Row(
              children: [
                Flexible(
                  flex: 1,
                  child: SizedBox(
                    child: TextField(
                      controller: _pressaoPacienteMax,
                      inputFormatters: [
                        LengthLimitingTextInputFormatter(2),
                      ],
                      decoration: const InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: 'Máxima',
                          hintText: 'Ex: 12',
                          focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                            width: 2,
                          ))),
                    ),
                  ),
                ),
                const EspacamentoComponente(size: 30, isHorizontal: true),
                Flexible(
                  flex: 1,
                  child: SizedBox(
                    child: TextField(
                      controller: _pressaoPacienteMin,
                      inputFormatters: [
                        LengthLimitingTextInputFormatter(2),
                      ],
                      decoration: const InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: 'Mínima',
                          hintText: 'Ex: 8',
                          focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                            width: 2,
                          ))),
                    ),
                  ),
                ),
              ],
            ),
            const EspacamentoComponente(size: 20),
            const Text('Valor de Risco:',
                style: TextStyle(fontWeight: FontWeight.w600)),
            const EspacamentoComponente(),
            Row(
              children: [
                Flexible(
                  flex: 1,
                  child: SizedBox(
                    child: TextField(
                      controller: _riscoMax,
                      inputFormatters: [
                        LengthLimitingTextInputFormatter(2),
                      ],
                      decoration: const InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: 'Máxima',
                          hintText: 'Ex: 16',
                          focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                            width: 2,
                          ))),
                    ),
                  ),
                ),
                const EspacamentoComponente(size: 30, isHorizontal: true),
                Flexible(
                  flex: 1,
                  child: SizedBox(
                    child: TextField(
                      controller: _riscoMin,
                      inputFormatters: [
                        LengthLimitingTextInputFormatter(2),
                      ],
                      decoration: const InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: 'Mínima',
                          hintText: 'Ex: 12',
                          focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                            width: 2,
                          ))),
                    ),
                  ),
                ),
              ],
            ),
            const EspacamentoComponente(size: 20),
            ElevatedButton(
              style: ButtonStyle(
                  fixedSize: MaterialStateProperty.all<Size>(Size(100, 30))),
              onPressed: handleSubmit,
              child: const Text(
                'Salvar',
                style: TextStyle(fontSize: 18),
              ),
            ),
            const Divider(
              height: 50,
              thickness: 2,
            ),
            Row(children: [
              const Text('Mudar tema',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600)),
              const EspacamentoComponente(isFull: true),
              Switch(
                value: storeConfig.tema == ThemeMode.dark,
                onChanged: (val) {
                  storeConfig.tema = val ? ThemeMode.dark : ThemeMode.light;
                },
              ),
            ])
          ],
        ),
      ),
    );
  }
}
