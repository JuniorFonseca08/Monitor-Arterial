import 'package:controle_pressao_arterial/entities/afazer_entity.dart';
import 'package:controle_pressao_arterial/paginas/home/componentes/configuracao_widget.dart';
import 'package:controle_pressao_arterial/paginas/home/componentes/novo_widget.dart';
import 'package:controle_pressao_arterial/services/afazer_service.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import '../services/imagem_service.dart';

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
    comentario: '',
  );
  List<AfazerEntity> _listAfazeres = [];

  AfazerProvider() {
    buscarAfazeres();
    buscarAfazerEntity();
  }

  buscarAfazeres() async {
    listaAfazeres = await service.buscar();
  }

  //
  buscarAfazerEntity() async {
    _afazerEntity = await service.buscarAfazerEntity() ?? _afazerEntity;
    notifyListeners();
  }

  List<AfazerEntity> get listaAfazeres => _listAfazeres;

  AfazerEntity get afazerEntity => _afazerEntity;

  set afazerEntity(AfazerEntity val) {
    _afazerEntity = val;
    service.salvarAfazerEntity(_afazerEntity);
    notifyListeners();
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
              service.salvarAfazerEntity(afazerEntity);
            }),
          ],
        );
      },
    );
  }

  //final pressaoMax = Provider.of<AfazerEntity>(context);
  //final data = item.data;
  //return GraficoData(x: index.toDouble(), y: pressaoMax, data: data);
  //}).toList();

  void onEditImage() async {
    final pickerService = PickerService();
    final image = await pickerService.getImage(ImageSource.gallery);
    if (image != null) {
      final base64 = pickerService.base64(await image.readAsBytes());
      afazerEntity.imagem = base64;
      service.salvarAfazerEntity(afazerEntity);
      notifyListeners();
    }
  }
}
