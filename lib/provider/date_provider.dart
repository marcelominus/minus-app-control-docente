import 'package:dio/dio.dart';

class DateProvider {
  Dio dio = new Dio();
  Future<String> date() async {
    var resp = await dio
        .post('http://157.230.231.143/informe-docente-b/api/date', data: {});
    var responseBody = resp.data;
    var date = responseBody['response'];
    print(date);
    return date;
    // if (lista.length == 0) {
    //   return {'response': null};
    // } else {
    //   final login = new Msg.fromJsonMap(responseBody['msg'][0]);
    //   return {'response': login};
    // }
  }
}
