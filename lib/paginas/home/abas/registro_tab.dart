
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

  @override
  Widget build(BuildContext context) {
        store = Provider.of<AfazerProvider>(context);

    return ListView.builder(
      itemCount: store.listaAfazeres.length,
      itemBuilder: (context, index){
        Text('aaaaaaaa');
      }
      );
  }
}
