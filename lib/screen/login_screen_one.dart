import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:send_data_1/components/rounded_button.dart';
import 'package:send_data_1/components/rounded_input_password.dart';
import 'package:send_data_1/components/rounded_input_text.dart';
import 'package:send_data_1/constants/constants.dart';
import 'package:send_data_1/constants/functions.dart';
import 'package:send_data_1/preference/preferencias_usuario.dart';
import 'package:send_data_1/provider/login_provider.dart';

class LoginScreenOne extends StatefulWidget {
  //----------------------------------------
  //Declaramos la ruta de acceso
  static final String routeName = 'login';
  //----------------------------------------
  @override
  _LoginScreenOneState createState() => _LoginScreenOneState();
}

class _LoginScreenOneState extends State<LoginScreenOne> {
  //----------------------------------------
  //Colocamos las variables antes del BUILD
  //----------------------------------------
  String user = '';
  String pass = '';
  bool checkInput;
  bool obscure = true;
  TextEditingController _controllerUser;
  TextEditingController _controllerPass;

  //----------------------------------------
  final loginProvider = new LoginProvider();
  final prefs = new PreferenciasUsuario();
  //----------------------------------------
  @override
  void initState() {
    super.initState();
    _controllerUser = new TextEditingController(text: '');
    _controllerPass = new TextEditingController(text: '');
  }

  //----------------------------------------
  @override
  Widget build(BuildContext context) {
    //----------------------------------------
    Size size = MediaQuery.of(context).size;
    //----------------------------------------
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text('Login'),
          backgroundColor: colorSix,
          elevation: 20.0,
        ),
        body: SingleChildScrollView(
          child: Container(
            color: colorOne,
            width: size.width,
            height: size.height * 0.88,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Text(
                  'Ingrese su Cuenta',
                  style: GoogleFonts.exo2(
                      fontSize: 18,
                      fontWeight: FontWeight.w500,
                      fontStyle: FontStyle.normal,
                      color: colorLight),
                ),
                space(),
                RoundedInputText(
                  hinttext: 'Ingrese su usuario',
                  icon: Icons.person,
                  onchanged: (e) {
                    user = e;
                  },
                  controller: _controllerUser,
                ),
                space(),
                RoundedInputPassword(
                  hinttext: 'Ingrese el password',
                  icon: Icons.lock,
                  onchanged: (e) {
                    pass = e;
                  },
                  onpressed: () {
                    setState(() {
                      obscure = !obscure;
                    });
                  },
                  controller: _controllerPass,
                  obscuretext: obscure,
                ),
                space(),
                RoundedButton(
                  text: 'Ingresar',
                  textcolor: Colors.white,
                  onpress: () {
                    checkInput = _checkInputs(user, pass);
                    if (checkInput == false) {
                      Functions()
                          .toastError('Datos Vacios Verifique las Entradas');
                    } else {
                      //Realizamos la peticion de nosotros
                      _sendPetition(user, pass, context);
                    }
                  },
                )
              ],
            ),
          ),
        ));
  }

  //----------------------------------------
  //Verifica si las entradas de ingreso son las correctas y realizamos el saneamiento de variables
  bool _checkInputs(String user, String pass) {
    user = user.toLowerCase();
    pass = pass.toLowerCase();
    if (user.toString().trim() == '' || pass.toString().trim() == '') {
      return false;
    } else {
      return true;
    }
  }

  //----------------------------------------
  //Realizamos la peticion de ingreso al SERVIDOR
  void _sendPetition(String name, String password, BuildContext context) {
    loginProvider.login(name, password).then((e) {
      if (e['response'] == null) {
        Functions().toastAlert('Datos incorrectos');
        setState(() {
          prefs.login = false;
          //**** => Reiniciamos las variables de USER Y PASS
          _controllerUser.clear();
          _controllerPass.clear();
        });
      } else {
        Functions().toastSuccess('Correcto');
        //**** => Guardamos las variables de recibidas el los preferences NOMBRE y CARNER
        //**** => Luego habilitamos PREFERENCE LOGIN donde no permitira ingresar directamente
        prefs.login = true;
        prefs.nombre = e['response'].nombre;
        prefs.carnet = e['response'].carnet;
        Navigator.pushNamed(context, 'formdata');
      }
    });
  }

  //----------------------------------------
  Widget space() {
    return SizedBox(
      height: 20,
    );
  }
}
