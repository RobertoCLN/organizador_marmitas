import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';
import '../models/marmita.dart';

class PreferencesService {
  // Chave para armazenar a lista de marmitas no SharedPreferences
  static const String _marmitasKey = 'marmitas';

  // Salvar a lista de marmitas no SharedPreferences
  // Usando o 'future' e o 'async' para garantir que a operação seja assíncrona
  Future<void> salvarMarmitas(List<Marmita> marmitas) async {
    final prefs = await SharedPreferences.getInstance();

    // Converter a lista de marmitas para uma lista de mapas JSON
    List<Map<String, dynamic>> marmitasJson = marmitas
        .map((m) => m.toJson())
        .toList();

    //transformar a lista de mapas JSON em uma string JSON
    String marmitasString = jsonEncode(marmitasJson);

    // Salvar a string JSON no SharedPreferences
    await prefs.setString(_marmitasKey, marmitasString);
  }

  //Carregar as marmitas do SharedPreferences
  Future<List<Marmita>> carregarMarmitas() async {
    final prefs = await SharedPreferences.getInstance();

    // busca a String JSON salva no SharedPreferences
    String? marmitasString = prefs.getString(_marmitasKey);

    // Se a string for nula, retorna uma lista vazia
    if (marmitasString == null) {
      return [];
    }

    // Se achou, converte a String de volta para lista
    List<dynamic> marmitasJson = jsonDecode(marmitasString);

    return marmitasJson.map((json) => Marmita.fromJson(json)).toList();
  }
}
