import 'package:controle_pressao_arterial/entities/afazer_entity.dart';
import 'package:controle_pressao_arterial/paginas/home/componentes/configuracao_widget.dart';
import 'package:controle_pressao_arterial/services/afazer_service.dart';
import 'package:flutter/material.dart';

import '../paginas/home/componentes/novo_item_widget.dart';

class AfazerProvider with ChangeNotifier {
  final service = AfazerService();
  List<AfazerEntity> _listAfazeres = [];
  AfazerEntity? _selecionado;

  AfazerProvider() {
    buscarAfazeres();
  }

  buscarAfazeres() async {
    listaAfazeres = await service.buscar();
  }
  

  List<AfazerEntity> get listaAfazeres => _listAfazeres;

  AfazerEntity? get selecionado => _selecionado;

  set selecionado(AfazerEntity? val) {
    _selecionado = val;
    notifyListeners();
  }

  void atualizarItemAfazer(int idx) {
    if (selecionado != null) {
      _listAfazeres[idx] = _selecionado!;
      notifyListeners();
    }
  }

  set listaAfazeres(List<AfazerEntity> val) {
    _listAfazeres = val;
    service.salvar(_listAfazeres);
    notifyListeners();
  }

  void removerItemAfazer(int index) {
    listaAfazeres.removeAt(index);
    service.salvar(listaAfazeres);
    notifyListeners();
  }

  void modalConfiguracao(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) {
        return SimpleDialog(
            contentPadding: const EdgeInsets.all(16),
            children: [
              ConfiguracaoWidget(callback: (item) {
                listaAfazeres = [item, ...listaAfazeres];
                notifyListeners();
              }),
            ]);
      },
    );
  }

 void modalNovoItem(BuildContext context) {
   showDialog(
     context: context,
     builder: (context) {
       return SimpleDialog(
           contentPadding: const EdgeInsets.all(16),
           children: [
             NovoItemWidget(callback: (item) {
               listaAfazeres = [];
               notifyListeners();
             }),
           ]);
     },
   );
 }
}
