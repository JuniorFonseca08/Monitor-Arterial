import 'package:controle_pressao_arterial/paginas/home/componentes/item_widget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../providers/afazer_provider.dart';

class RegistroTab extends StatefulWidget {
  const RegistroTab({super.key});

  @override
  State<RegistroTab> createState() => _RegistroTabState();
}

class _RegistroTabState extends State<RegistroTab> {
  late AfazerProvider store;

  void handleExcluir(int index) {
    store.removerItemAfazer(index);
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    store = Provider.of<AfazerProvider>(context);

    return ListView.builder(
      itemCount: store.listaAfazeres.length,
      itemBuilder: (context, index) {
        final item = store.listaAfazeres.elementAt(index);
        return Dismissible(
          key: Key(item.uuid),
          onDismissed: (direction) {
            if (direction == DismissDirection.startToEnd) {
              handleExcluir(index);
            }
          },
          child: ItemWidget(item: item),
        );
      },
    );
  }
}
