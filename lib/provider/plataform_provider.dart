import 'package:dio/dio.dart';

class PlataformProvider {
  Dio dio = new Dio();
  Future<List<String>> plat() async {
    var resp = await dio.post(
        'http://157.230.231.143/informe-docente-b/api/plataform',
        data: {});
    var responseBody = resp.data;
    var lista = responseBody['request'];

    if (lista.length == 0) {
      return [];
    } else {
      List<String> plataform = new List();
      lista.map((e) {
        plataform.add(e['plataforma']);
      }).toList();
      plataform.insert(0, "Seleccione una Plataforma");

      return plataform;
    }
  }
}
