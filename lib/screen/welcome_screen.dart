import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
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
        height: size.height,
        child: Column(
          children: [
            Container(
              color: colorOne,
              child: ClipRRect(
                borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(40.0),
                    bottomRight: Radius.circular(40.0)),
                child: Image(image: AssetImage('lib/assets/img/etn.jpg')),
              ),
            ),
            Container(
              width: size.width,
              height: size.height * 0.63,
              color: colorOne,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Text(
                    'Bienvenido',
                    style: GoogleFonts.exo2(
                        fontSize: 20,
                        fontWeight: FontWeight.w500,
                        fontStyle: FontStyle.normal,
                        color: colorLight),
                  ),
                  SizedBox(
                    height: size.height * 0.02,
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
                  SizedBox(
                    height: size.height * 0.05,
                  ),
                  ClipRRect(
                      borderRadius: BorderRadius.circular(20.0),
                      child: Image(
                          width: size.width * 0.25,
                          image: AssetImage(
                              'lib/assets/img/umsaelectronica.jpg'))),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
