import 'package:dio/dio.dart';

class TimerProvider {
  Dio dio = new Dio();
  Future<String> start() async {
    var resp = await dio.post(
        'http://157.230.231.143/informe-docente-b/api/timerstart',
        data: {});
    var responseBody = resp.data;
    var timerstart = responseBody['response'];
    print(timerstart);
    return timerstart;
    // if (lista.length == 0) {
    //   return {'response': null};
    // } else {
    //   final login = new Msg.fromJsonMap(responseBody['msg'][0]);
    //   return {'response': login};
    // }
  }

  Future<String> end() async {
    var resp = await dio.post(
        'http://157.230.231.143/informe-docente-b/api/timerend',
        data: {});
    var responseBody = resp.data;
    var timerend = responseBody['response'];
    print(timerend);
    return timerend;
    // if (lista.length == 0) {
    //   return {'response': null};
    // } else {
    //   final login = new Msg.fromJsonMap(responseBody['msg'][0]);
    //   return {'response': login};
    // }
  }
}
