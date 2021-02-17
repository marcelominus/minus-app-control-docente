import 'package:flutter/material.dart';
import 'package:send_data_1/components/rounded_button.dart';
import 'package:send_data_1/constants/constants.dart';

class WelcomeScreen extends StatelessWidget {
  // const WelcomeScreen({Key key}) : super(key: key);
  //Colocamos las variables antes del BUILD
  static final String routeName = 'welcome';
  //

  @override
  Widget build(BuildContext context) {
    //Colocamos las varibles de tamanio
    Size size = MediaQuery.of(context).size;
    //
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Bienvenidos',
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
                Navigator.pushNamed(context, 'login');
              },
              textcolor: Colors.white,
            ),
          ],
        ),
      ),
    );
  }
}
