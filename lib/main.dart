import 'package:flutter/material.dart';
import 'package:send_data_1/preference/preferencias_usuario.dart';
import 'package:send_data_1/screen/detail_screen.dart';
import 'package:send_data_1/screen/form_data_screen.dart';
import 'package:send_data_1/screen/form_select_screen.dart';
import 'package:send_data_1/screen/information_screen.dart';
import 'package:send_data_1/screen/login_screen_one.dart';
import 'package:send_data_1/screen/welcome_screen.dart';

void main() async {
  runApp(MyApp());
  final prefs = new PreferenciasUsuario();
  await prefs.initPrefs();
}

class MyApp extends StatelessWidget {
  const MyApp({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Inicio',
        // initialRoute: WelcomeScreen.routeName,
        initialRoute: WelcomeScreen.routeName,

        routes: {
          WelcomeScreen.routeName: (BuildContext context) => WelcomeScreen(),
          LoginScreenOne.routeName: (BuildContext context) => LoginScreenOne(),
          InformationScreen.routeName: (BuildContext context) =>
              InformationScreen(),
          FormDataScreen.routeName: (BuildContext context) => FormDataScreen(),
          DetailScreen.routeName: (BuildContext context) => DetailScreen(),
          FormSelectScreen.routeName: (BuildContext context) =>
              FormSelectScreen(),
        },
      ),
    );
  }
}
