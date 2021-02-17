import 'package:dio/dio.dart';
import 'package:send_data_1/model/login_model.dart';

class LoginProvider {
  Dio dio = new Dio();
  Future<Map<String, dynamic>> login(name, password) async {
    var resp = await dio.post('http://157.230.231.143/informe-docente-b/api/',
        data: {"user": name, "pass": password});
    var responseBody = resp.data;
    var lista = responseBody['msg'];

    if (lista.length == 0) {
      return {'response': null};
    } else {
      final login = new Msg.fromJsonMap(responseBody['msg'][0]);
      return {'response': login};
    }
  }
}
