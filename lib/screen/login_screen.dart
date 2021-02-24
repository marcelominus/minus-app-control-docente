import 'package:flutter/material.dart';
import 'package:send_data_1/components/rounded_button.dart';
import 'package:send_data_1/components/rounded_input_password.dart';
import 'package:send_data_1/components/rounded_input_text.dart';
import 'package:send_data_1/constants/constants.dart';
import 'package:send_data_1/constants/functions.dart';
import 'package:send_data_1/preference/preferencias_usuario.dart';
import 'package:send_data_1/provider/login_provider.dart';

class LoginScreen extends StatelessWidget {
  // const LoginScreen({Key key}) : super(key: key);
  //Colocamos las variables antes del BUILD
  static final String routeName = 'login';
  //
  String user = '', pass = '';
  bool checkInput;
  final loginProvider = new LoginProvider();
  final prefs = new PreferenciasUsuario();

  //----------------------------------------
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
        appBar: AppBar(
          title: Text('Login'),
          backgroundColor: colorSix,
          elevation: 20.0,
        ),
        body: Container(
          color: colorOne,
          width: size.width,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Text(
                'Ingrese su Usuario',
                style: TextStyle(color: colorLight, fontSize: 18.0),
              ),
              SizedBox(
                height: 20,
              ),
              RoundedInputText(
                hinttext: 'Ingrese su usuario',
                icon: Icons.person,
                onchanged: (e) {
                  user = e;
                },
              ),
              SizedBox(
                height: 20,
              ),
              RoundedInputPassword(
                hinttext: 'Ingrese el password',
                icon: Icons.lock,
                onchanged: (e) {
                  pass = e;
                },
              ),
              SizedBox(
                height: 20,
              ),
              RoundedButton(
                text: 'Ingresar',
                textcolor: Colors.white,
                onpress: () {
                  checkInput = _checkInputs(user, pass);
                  if (checkInput == false) {
                    Functions()
                        .toastError('Datos Vacios Verifique las Entradas');
                  } else {
                    _sendPetition(user, pass, context);
                    // setState(() {
                    //   print(prefs.nombreUsuario);
                    // });
                    //_sendPetition(name, password);
                  }
                  // Navigator.pushNamed(context, 'formdata');
                },
              )
            ],
          ),
        ));
  }

  bool _checkInputs(String user, String pass) {
    if (user.toString().trim() == '' || pass.toString().trim() == '') {
      return false;
    } else {
      return true;
    }
  }

  void _sendPetition(String name, String password, BuildContext context) {
    loginProvider.login(name, password).then((e) {
      if (e['response'] == null) {
        Functions().toastAlert('Datos incorrectos');
        prefs.login = false;
      } else {
        Functions().toastSuccess('Correcto');
        prefs.login = true;
        prefs.nombre = e['response'].nombre;
        prefs.carnet = e['response'].carnet;
        Navigator.pushNamed(context, 'formselect');
      }
    });
  }
}
