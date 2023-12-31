import 'package:controle_pressao_arterial/componentes/corpo_componente.dart';
import 'package:controle_pressao_arterial/paginas/home/abas/afazeres_tab.dart';
import 'package:controle_pressao_arterial/providers/afazer_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'abas/registro_tab.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late AfazerProvider store;
  late int abaSelecionada;

  final List<BottomNavigationBarItem> _aba = [
    const BottomNavigationBarItem(
        icon: Icon(Icons.home_rounded), label: 'Home'),
    const BottomNavigationBarItem(
        icon: Icon(Icons.insert_drive_file_outlined), label: 'Registros'),
  ];

  final List<Widget> _conteudos = [
    const AfazeresTab(),
    const RegistroTab(),
  ];

  void handleTab(int tabIdx) {
    setState(() {
      abaSelecionada = tabIdx;
    });
  }

  @override
  void initState() {
    abaSelecionada = 0;
    store = Provider.of<AfazerProvider>(context, listen: false);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return CorpoComponente(
      margin: const EdgeInsets.all(0),
      padding: const EdgeInsets.all(0),
      bar: BottomNavigationBar(
        onTap: handleTab,
        currentIndex: abaSelecionada,
        items: _aba,
      ),
      actionButton: FloatingActionButton(
        onPressed: () => store.modalNovoItem(context),
        child: const Icon(
          Icons.add,
          size: 40,
        ),
      ),
      actionLocation: FloatingActionButtonLocation.centerDocked,
      child: _conteudos.elementAt(abaSelecionada),
    );
  }
}
