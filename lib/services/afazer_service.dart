import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';

import '../entities/afazer_entity.dart';

class AfazerService {
  final _key = 'KEY_AFAZER';

//Future<void> salvar(List<AfazerEntity> itens) async {
//  SharedPreferences prefs = await SharedPreferences.getInstance();
//  String listJson =
//      jsonEncode(itens.map((item) => item.toJson()).toList()).toString();
//  //String listJson = jsonEncode(itens);
//  await prefs.setString(_key, listJson);
//}
  Future<void> salvar(List<AfazerEntity> itens) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    List<Map<String, dynamic>> jsonList =
        itens.map((item) => item.toJson()).toList();
    await prefs.setString(_key, jsonEncode(jsonList));
  }

  Future<List<AfazerEntity>> buscar() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? listJson = prefs.getString(_key);
    if (listJson != null) {
      return AfazerEntity.fromJsonList(jsonDecode(listJson));
    }
    return [];
  }

  Future<void> salvarAfazer(AfazerEntity afazer) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String afazerJson = jsonEncode(afazer.toJson());
    await prefs.setString(_key, afazerJson);
  }
}
