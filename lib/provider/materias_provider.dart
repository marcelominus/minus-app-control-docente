import 'package:dio/dio.dart';
import 'package:send_data_1/preference/preferencias_usuario.dart';

class MateriasProvider {
  final prefs = new PreferenciasUsuario();

  Dio dio = new Dio();
  Future<List<String>> mat() async {
    var resp = await dio.post(
        'http://157.230.231.143/informe-docente-b/api/teacher',
        data: {"carnet": prefs.carnet});
    var responseBody = resp.data;
    var lista = responseBody['request'];

    if (lista.length == 0) {
      return [];
    } else {
      List<String> materias = new List();
      lista.map((e) {
        materias.add(e['sigla']);
      }).toList();
      materias.insert(0, "Seleccione una Opcion");
      return materias;
    }
  }
}
