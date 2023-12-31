import 'package:controle_pressao_arterial/entities/afazer_entity.dart';
import 'package:controle_pressao_arterial/paginas/home/componentes/data/grafico_data.dart';
import 'package:controle_pressao_arterial/paginas/home/componentes/grafico/line_grafico.dart';
import 'package:controle_pressao_arterial/providers/afazer_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../componentes/espacamento_componente.dart';
import '../../../services/imagem_service.dart';

class AfazeresTab extends StatefulWidget {
  final AfazerEntity? item;
  const AfazeresTab({
    super.key,
    this.item,
  });

  @override
  State<AfazeresTab> createState() => _AfazeresTabState();
}

class _AfazeresTabState extends State<AfazeresTab> {
  late AfazerProvider store;
  AfazerEntity item = AfazerEntity(uuid: '', comentario: '');

  Widget makeImage() {
    if (store.afazerEntity.imagem != null) {
      return Image.memory(
        PickerService().decodeBase64(store.afazerEntity.imagem!),
        fit: BoxFit.cover,
        width: 80,
        height: 80,
      );
    }
    return const Icon(Icons.image_search, size: 20);
  }

  @override
  void initState() {
    store = AfazerProvider();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    store = Provider.of<AfazerProvider>(context);
    final afazerEntity = Provider.of<AfazerProvider>(context).afazerEntity;

    return SingleChildScrollView(
      child: Container(
        padding: const EdgeInsets.all(8),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Card(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
              child: Row(
                children: [
                  Stack(
                    alignment: Alignment.center,
                    children: [
                      CircleAvatar(
                        radius: 40,
                        child: ClipOval(
                          child: makeImage(),
                        ),
                      ),
                      Positioned(
                        right: -12,
                        bottom: -12,
                        child: IconButton(
                          onPressed: () {
                            store.onEditImage();
                          },
                          icon: const Icon(Icons.photo_camera_rounded),
                          iconSize: 30,
                        ),
                      ),
                    ],
                  ),
                  const EspacamentoComponente(size: 20, isHorizontal: true),
                  Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(store.afazerEntity.nome ?? '',
                            style: const TextStyle(
                                fontSize: 22, fontWeight: FontWeight.w600)),
                        Text(
                            store.afazerEntity.idade != null
                                ? '${store.afazerEntity.idade} anos'
                                : '',
                            style: const TextStyle(
                                fontSize: 16, fontWeight: FontWeight.w400)),
                      ]),
                  const EspacamentoComponente(isFull: true),
                  IconButton(
                    onPressed: () {
                      store.modalConfiguracao(context);
                    },
                    icon: const Icon(Icons.settings, size: 33),
                  ),
                  const EspacamentoComponente(size: 20, isHorizontal: true)
                ],
              ),
            ),
          ),
          const EspacamentoComponente(),
          Card(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
              child: Column(children: [
                const Text('Controle da Pressão Arterial',
                    style:
                        TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                const EspacamentoComponente(),
                Row(
                  children: [
                    Text(
                        'Pressão do Paciente:   ${store.afazerEntity.pressaoPacienteMax} / ${store.afazerEntity.pressaoPacienteMin}',
                        style: const TextStyle(fontSize: 16)),
                  ],
                ),
                const EspacamentoComponente(),
                Row(
                  children: [
                    Text(
                        'Valor de Risco:   ${store.afazerEntity.pressaoRiscoMax} / ${store.afazerEntity.pressaoRiscoMin}',
                        style: const TextStyle(fontSize: 16)),
                  ],
                ),
                const EspacamentoComponente(size: 20),
                const Divider(thickness: 1),
                const EspacamentoComponente(size: 20),
                Row(children: [
                  const Icon(Icons.list),
                  const SizedBox(width: 8),
                  Text('Total de aferições:   ${store.listaAfazeres.length}',
                      style: const TextStyle(fontSize: 16)),
                ]),
                const EspacamentoComponente(),
              ]),
            ),
          ),
          Card(
            child: Column(children: [
              const EspacamentoComponente(size: 16),
              const Text(
                'Monitoramento da Pressão Arterial',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const EspacamentoComponente(),
              LineGrafico(
                pontoMax: getChartData(store.listaAfazeres, afazerEntity),
                pontoMin: getChartData(store.listaAfazeres, afazerEntity),
              )
            ]),
          )
        ]),
      ),
    );
  }
}
