import 'package:flutter/material.dart';
import 'package:send_data_1/components/rounded_button.dart';
import 'package:send_data_1/constants/constants.dart';
import 'package:send_data_1/preference/preferencias_usuario.dart';

class WelcomeScreen extends StatelessWidget {
  // const WelcomeScreen({Key key}) : super(key: key);
  //Colocamos las variables antes del BUILD
  static final String routeName = 'welcome';
  //
  final prefs = new PreferenciasUsuario();

  @override
  Widget build(BuildContext context) {
    //Colocamos las varibles de tamanio
    Size size = MediaQuery.of(context).size;
    //
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'Bienvenido',
        ),
        backgroundColor: colorSix,
        elevation: 20.0,
      ),
      body: Container(
        width: size.width,
        color: colorOne,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Text(
              'INICIO',
              style: TextStyle(
                color: colorLight,
              ),
            ),
            SizedBox(
              height: size.height * 0.05,
            ),
            RoundedButton(
              text: 'Ingresar',
              onpress: () {
                if (prefs.login) {
                  Navigator.pushNamed(context, 'formdata');
                } else {
                  Navigator.pushNamed(context, 'login');
                }
              },
              textcolor: Colors.white,
            ),
          ],
        ),
      ),
    );
  }
}
