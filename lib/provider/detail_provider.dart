import 'package:dio/dio.dart';
import 'package:send_data_1/model/detail_model.dart';
import 'package:send_data_1/preference/preferencias_usuario.dart';

class DetailProviderNew {
  final prefs = new PreferenciasUsuario();

  Dio dio = new Dio();
  Future<List<Responsen>> fech() async {
    var resp = await dio
        .post('http://157.230.231.143/informe-docente-b/api/detail', data: {
      "carnet": prefs.carnet,
      "fecha": prefs.datesearch,
      "materia": prefs.siglasearch
    });
    var responseBody = resp.data;
    var lista = responseBody['response'];
    final det = new Detail.fromJsonList(lista);
    return det.detail;
  }
}
