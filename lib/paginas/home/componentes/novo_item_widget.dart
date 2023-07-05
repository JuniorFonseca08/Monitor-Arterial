import 'package:controle_pressao_arterial/componentes/espacamento_componente.dart';
import 'package:controle_pressao_arterial/entities/pressao_entity.dart';
import 'package:flutter/material.dart';

class NovoItemWidget extends StatefulWidget {
  final void Function(PressaoEntity item) callback;

  const NovoItemWidget({
    super.key,
    required this.callback,
  });

  @override
  State<NovoItemWidget> createState() => _NovoItemWidgetState();
}

enum TipoLista {
  lembrete,
  tarefa,
}

class _NovoItemWidgetState extends State<NovoItemWidget> {
  final _formKey = GlobalKey<FormState>();
  final _comentario = TextEditingController();
  final _pressaoMax = TextEditingController();
  final _pressaoMin = TextEditingController();
  final _data = TextEditingController();

  List<TextEditingController> itens = [];
  TipoLista dropdownValue = TipoLista.lembrete;

  Widget defaultCheckItem(TextEditingController controller) {
    return CheckboxListTile(
      title: TextFormField(
        controller: controller,
        decoration:
            const InputDecoration(hintText: 'Digite um nome para a tarefa'),
        validator: (value) {
          return (value == null || value.isEmpty)
              ? 'Por favor, digite um nome'
              : null;
        },
      ),
      controlAffinity: ListTileControlAffinity.leading,
      contentPadding: const EdgeInsets.all(0),
      value: false,
      onChanged: null,
    );
  }

  void handleSubmit() {
      final item = PressaoEntity(
        comentario: _comentario.text,
      pressaoMax:  int.parse(_pressaoMax.text),
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
      child: Column(children: [
        Row(
          children: [
            const Text('Tipo de lista', style: TextStyle(fontSize: 18)),
            const EspacamentoComponente(isFull: true),
            Expanded(
                  child: SizedBox(
                    child: TextField(
                      controller: _comentario,
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
                
            const EspacamentoComponente(),
            ElevatedButton(
              onPressed: handleSubmit,
              child: const Text('Salvar'),
            ),
          ],
        ),
      ]),
    );
  }
}
