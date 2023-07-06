import 'package:controle_pressao_arterial/providers/afazer_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../componentes/espacamento_componente.dart';

class AfazeresTab extends StatefulWidget {
  const AfazeresTab({
    super.key,
  });

  @override
  State<AfazeresTab> createState() => _AfazeresTabState();
}

class _AfazeresTabState extends State<AfazeresTab> {
  late AfazerProvider store;

  @override
  void initState() {
    store = AfazerProvider();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    store = Provider.of<AfazerProvider>(context);

    return Container(
      padding: const EdgeInsets.all(8),
      color: Colors.lightBlueAccent,
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
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                  Text(store.afazerEntity.nome ?? 'Digite seu nome',
                      style: const TextStyle(
                          fontSize: 18, fontWeight: FontWeight.w700)),
                  Text(
                      store.afazerEntity.idade != null
                          ? store.afazerEntity.idade.toString()
                          : 'Idade',
                      style: const TextStyle(
                          fontSize: 14, fontWeight: FontWeight.w200)),
                ]),
                const EspacamentoComponente(isFull: true),
                IconButton(
                  onPressed: () {
                    store.modalConfiguracao(context);
                  },
                  icon: const Icon(Icons.edit_note_rounded),
                )
              ],
            ),
          ),
        ),
        const EspacamentoComponente(),
        Card(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
            child: Column(children: [
              const Text('Controle de Pressão Arterial',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
              const EspacamentoComponente(),
              Row(
                children: [
                  const Text('Pressão do Paciente: '),
                  const EspacamentoComponente(size: 20, isHorizontal: true),
                  Text(store.afazerEntity.pressaoPacienteMax.toString()),
                  const EspacamentoComponente(size: 20, isHorizontal: true),
                  Text(store.afazerEntity.pressaoPacienteMin.toString()),
                  const EspacamentoComponente(size: 20, isHorizontal: true),
                ],
              ),
              const EspacamentoComponente(),
              Row(
                children: [
                  const Text('Valor de Risco: '),
                  const EspacamentoComponente(size: 20, isHorizontal: true),
                  Text(store.afazerEntity.pressaoRiscoMax.toString()),
                  const EspacamentoComponente(size: 20, isHorizontal: true),
                  Text(store.afazerEntity.pressaoRiscoMin.toString()),
                  const EspacamentoComponente(size: 60, isHorizontal: true),
                ],
              ),
              const Divider(color: Colors.grey, thickness: 1),
              const EspacamentoComponente(),
              Row(children: [
                Icon(Icons.list),
                SizedBox(width: 8),
                Text('Total de aferições: '),
                Text(store.listaAfazeres.length.toString()),
              ]),
              const EspacamentoComponente(),
              const Row(children: [
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
