import 'package:flutter/material.dart';
import 'package:uuid/uuid.dart';
import '../../../componentes/espacamento_componente.dart';
import '../../../entities/afazer_entity.dart';

class NovoItem extends StatefulWidget {
  final void Function(AfazerEntity item) callback;

  const NovoItem({
    super.key,
    required this.callback,
  });

  @override
  State<NovoItem> createState() => _NovoItemState();
}

class _NovoItemState extends State<NovoItem> {
  final _formKey = GlobalKey<FormState>();
  final _comentario = TextEditingController();
  final _pressaoMax = TextEditingController();
  final _pressaoMin = TextEditingController();

  void handleSubmit() {
    final item = AfazerEntity(
      uuid: const Uuid().v4(),
      comentario: _comentario.text,
      pressaoMax: int.parse(_pressaoMax.text),
      pressaoMin: int.parse(_pressaoMin.text),
      data: DateTime.now(),
    );
    widget.callback(item);
    Navigator.pop(context);
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
        key: _formKey,
        child: Column(
          children: [
            const Text('Resultado:'),
            const EspacamentoComponente(),
            const Text(
                'Por favor, preencha os campos abaixo com o resultado obtido na aferição da pressão'),
            const EspacamentoComponente(),
            Row(
              children: [
                Flexible(
                  child: SizedBox(
                    child: TextField(
                      controller: _pressaoMax,
                      decoration: const InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: 'Máxima',
                          hintText: 'Ex: 120',
                          focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                            width: 2,
                          ))),
                    ),
                  ),
                ),
                const EspacamentoComponente(size: 20, isHorizontal: true),
                Flexible(
                  child: SizedBox(
                    child: TextField(
                      controller: _pressaoMin,
                      decoration: const InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: 'Mínima',
                          hintText: 'Ex: 80',
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
            const EspacamentoComponente(),
            const Text(
                'Se desejar, use o campo abaixo para fazer um comentario ou observação'),
            const EspacamentoComponente(),
            Row(
              children: [
                Expanded(
                  child: SizedBox(
                    child: TextField(
                      controller: _comentario,
                      decoration: const InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: 'Comentario',
                          hintText: 'Ex. Mal estar',
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
            const EspacamentoComponente(),
            ElevatedButton(
              onPressed: handleSubmit,
              child: const Text('Salvar'),
            ),
          ],
        ));
  }
}
