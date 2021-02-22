import 'package:dio/dio.dart';

class SendProvider {
  Dio dio = new Dio();
  Future<String> send(materia, titulo, cantidad, fecha, horaini, plataforma,
      avance, respaldo, horafinal, foto, observacion, identificador) async {
    var resp = await dio
        .post('http://157.230.231.143/informe-docente-b/api/dates', data: {
      "materia": materia,
      "titulo": titulo,
      "cantidad": cantidad,
      "fecha": fecha,
      "horaini": horaini,
      "plataforma": plataforma,
      "avance": avance,
      "respaldo": respaldo,
      "horafinal": horafinal,
      "foto": foto,
      "observacion": observacion,
      "identificador": identificador
    });
    var responseBody = resp.data;
    var lista = responseBody['msg'];
    print(lista);
    // if (lista.length == 0) {
    //   return 'incorrecto';
    // } else {
    //   final login = new Msg.fromJsonMap(responseBody['msg'][0]);
    //   return 'correcto';
    // }
    return 'correcto';
  }
}
