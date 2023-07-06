import 'package:controle_pressao_arterial/entities/afazer_entity.dart';
import 'package:controle_pressao_arterial/paginas/home/componentes/configuracao_widget.dart';
import 'package:controle_pressao_arterial/paginas/home/componentes/novo_widget.dart';
import 'package:controle_pressao_arterial/services/afazer_service.dart';
import 'package:flutter/material.dart';

class AfazerProvider with ChangeNotifier {
  final service = AfazerService();
  AfazerEntity _afazerEntity = AfazerEntity(
      uuid: '',
      nome: 'Crie seu perfil',
      idade: null,
      pressaoPacienteMax: 0,
      pressaoPacienteMin: 0,
      pressaoRiscoMax: 0,
      pressaoRiscoMin: 0,
      conteudos: [],
      comentario: '');
  List<AfazerEntity> _listAfazeres = [];

  AfazerProvider() {
    buscarAfazeres();
  }

  buscarAfazeres() async {
    listaAfazeres = await service.buscar();
  }

  List<AfazerEntity> get listaAfazeres => _listAfazeres;

  AfazerEntity get afazerEntity => _afazerEntity;

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

  void modalNovoItem(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) {
        return SimpleDialog(
            contentPadding: const EdgeInsets.all(16),
            children: [
              NovoItem(callback: (item) {
                listaAfazeres = [item, ...listaAfazeres];
                notifyListeners();
              }),
            ]);
      },
    );
  }

  void modalConfiguracao(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) {
        return SimpleDialog(
            contentPadding: const EdgeInsets.all(16),
            children: [
              ConfiguracaoWidget(callback: (item) {
                afazerEntity.nome = item.nome;
                afazerEntity.idade = item.idade;
                afazerEntity.pressaoPacienteMax = item.pressaoPacienteMax;
                afazerEntity.pressaoPacienteMin = item.pressaoPacienteMin;
                afazerEntity.pressaoRiscoMax = item.pressaoRiscoMax;
                afazerEntity.pressaoRiscoMin = item.pressaoRiscoMin;
                notifyListeners();
              }),
            ]);
      },
    );
  }
}



//_afazerEntity.conteudos.add(item);