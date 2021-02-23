import 'package:dio/dio.dart';
import 'package:send_data_1/model/mat_new_model.dart';
import 'package:send_data_1/preference/preferencias_usuario.dart';

class MateriasProviderNew {
  final prefs = new PreferenciasUsuario();

  Dio dio = new Dio();
  Future<List<Request>> mat() async {
    var resp = await dio.post(
        'http://157.230.231.143/informe-docente-b/api/teacher',
        data: {"carnet": prefs.carnet});
    var responseBody = resp.data;
    var lista = responseBody['request'];
    final mat = new Materias.fromJsonList(lista);
    return mat.materias;
  }
}
