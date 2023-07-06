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
  //final _data = TextEditingController();

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
            const Text('Preencha os dados:'),
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
                const Text('Preencha:'),
                const EspacamentoComponente(isHorizontal: true, size: 8),
                Flexible(
                  child: SizedBox(
                    //width: 50,
                    //height: 20,
                    child: TextField(
                      controller: _pressaoMax,
                      decoration: const InputDecoration(
                          border: OutlineInputBorder(),
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
                      controller: _pressaoMin,
                      decoration: const InputDecoration(
                          border: OutlineInputBorder(),
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
