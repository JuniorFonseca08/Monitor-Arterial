import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';

import '../entities/afazer_entity.dart';

class AfazerService {
  final _key = 'KEY_AFAZER';

  Future<void> salvar(List<AfazerEntity> itens) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String listJson = jsonEncode(itens);
    await prefs.setString(_key, listJson);
  }

  Future<List<AfazerEntity>> buscar() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? listJson = prefs.getString(_key);
    if (listJson != null) {
      return AfazerEntity.fromJsonList(jsonDecode(listJson));
    }
    return [];
  }

  Future<void> salvarAfazerEntity(AfazerEntity afazerEntity) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String afazerJson = jsonEncode(afazerEntity.toJson());
    await prefs.setString('KEY_AFAZER_ENTITY', afazerJson);
  }

  Future<AfazerEntity?> buscarAfazerEntity() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? afazerJson = prefs.getString('KEY_AFAZER_ENTITY');
    if (afazerJson != null) {
      return AfazerEntity.fromJson(jsonDecode(afazerJson));
    }
    return null;
  }
}
