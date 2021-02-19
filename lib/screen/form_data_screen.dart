import 'package:flutter/material.dart';
import 'package:send_data_1/components/camera_form.dart';
import 'package:send_data_1/components/card_title.dart';
import 'package:send_data_1/components/checkbox_form.dart';
import 'package:send_data_1/components/drawer_menu.dart';
import 'package:send_data_1/components/dropdown_menu_list.dart';
import 'package:send_data_1/components/input_form_area.dart';
import 'package:send_data_1/components/input_form_area_new.dart';
import 'package:send_data_1/components/input_form_text.dart';
import 'package:send_data_1/components/rounded_button.dart';
import 'package:send_data_1/components/slider_form.dart';
import 'package:send_data_1/constants/constants.dart';
import 'package:send_data_1/preference/preferencias_usuario.dart';
import 'package:send_data_1/provider/date_provider.dart';
import 'package:send_data_1/provider/materias_provider.dart';
import 'package:send_data_1/provider/plataform_provider.dart';
import 'package:send_data_1/provider/timer_provider.dart';

class FormDataScreen extends StatefulWidget {
  static final String routeName = 'formdata';

  @override
  _FormDataScreenState createState() => _FormDataScreenState();
}

class _FormDataScreenState extends State<FormDataScreen> {
  //======================================
  //Variables Globales
  //======================================

  //----------------------------------------
  final materiasProvider = new MateriasProvider();
  final plataformProvider = new PlataformProvider();
  final dateProvider = new DateProvider();
  final timerProvider = new TimerProvider();
  final prefs = new PreferenciasUsuario();
  List<String> materias = ['Seleccione una Materia'];
  //----------------------------------------
  String asignature;
  String theme;
  String quantity;
  String plataform;
  double advance = 0.0;
  bool back = false;
  //----------------------------------------
  @override
  Widget build(BuildContext context) {
    //======================================
    //Variables Locales
    //======================================
    Size size = MediaQuery.of(context).size; //**** => Tamanio de pantallaS
    //=========================================
    return Scaffold(
      appBar: AppBar(
        title: Text('Formulario'),
        actions: <Widget>[_closeSession(context)],
      ),
      drawer: DrawerMenu(),
      body: SingleChildScrollView(
        child: Container(
          width: size.width,
          color: colorOne,
          child: Column(
            children: <Widget>[
              _cardTitle(prefs.nombre),
              space(),
              _getAsignature(context, size),
              space(),
              InputFormArea(
                name: 'Tema',
                hinttext: 'Ingrese el titulo del tema avanzado',
                onchanged: (e) {
                  theme = e;
                },
              ),
              space(),
              InputForm(
                name: 'Cantidad de estudiantes.',
                onchanged: (e) {
                  quantity = e;
                },
              ),
              space(),
              _roundedButtonDate(),
              space(),
              _roundedButtonTimeStar(),
              space(),
              _getPlataform(context, size),
              space(),
              _sliderForm(),
              space(),
              _checkForm(),
              space(),
              _roundedButtonTimeEnd(),
              space(),
              InputFormArea(
                name: 'Observaciones',
                hinttext: 'Ingrese alguna observacion.',
              ),
              space(),
              CameraForm(),
              space(),
              _roundedSendInformation(size),
            ],
          ),
        ),
      ),
    );
  }

  //----------------------------------------
  Widget space() {
    return SizedBox(
      height: 15,
    );
  }

  //----------------------------------------
  Widget _closeSession(BuildContext context) {
    return Padding(
        padding: EdgeInsets.only(right: 20.0, top: 20.0),
        child: GestureDetector(
          onTap: () {
            prefs.login = false;
            Navigator.pushNamed(context, 'welcome');
          },
          child: Text('Cerrar Sesión'),
        ));
  }

  //----------------------------------------
  Widget _cardTitle(texto) {
    return CardTitle(
      text: texto,
    );
  }

  //----------------------------------------
  Widget _dropdownMenuListAsig(List<String> list, String name) {
    return DropdownMenuList(
      name: name,
      items: list,
      onChangedFirst: (val) {
        asignature = val;
      },
    );
  }

  Widget _dropdownMenuListPlataform(List<String> list, String name) {
    return DropdownMenuList(
      name: name,
      items: list,
      onChangedFirst: (val) {
        print(val);
        plataform = val;
      },
    );
  }

  //----------------------------------------
  Widget _roundedButtonDate() {
    return RoundedButton(
      text: prefs.date,
      textcolor: prefs.datebool ? colorDark : colorLight,
      onpress: () {
        if (prefs.datebool == false) {
          dateProvider.date().then((value) {
            setState(() {
              prefs.date = value;
              prefs.datebool = true;
            });
          });
        }
      },
      sizebutton: 0.9,
      color: prefs.datebool ? colorFour : colorThree,
    );
  }

  //----------------------------------------
  Widget _roundedButtonTimeStar() {
    return RoundedButton(
      text: prefs.timerstart,
      textcolor: prefs.timerstartbool ? colorDark : colorLight,
      onpress: () {
        if (prefs.timerstartbool == false) {
          timerProvider.start().then((value) {
            setState(() {
              prefs.timerstart = value;
              prefs.timerstartbool = true;
            });
          });
        }
      },
      sizebutton: 0.9,
      color: prefs.timerstartbool ? colorFour : colorThree,
    );
  }

  //----------------------------------------
  Widget _sliderForm() {
    return SliderForm(
        onChangedFirst: (e) {
          print(e);
          setState(() {
            advance = e;
          });
        },
        name: 'Avance ${advance.toInt()}',
        min: 0.0,
        max: 100.0);
  }

  //----------------------------------------
  Widget _roundedButtonTimeEnd() {
    return RoundedButton(
      text: prefs.timerend,
      textcolor: prefs.timerendbool ? colorDark : colorLight,
      onpress: () {
        if (prefs.timerendbool == false) {
          timerProvider.end().then((value) {
            setState(() {
              prefs.timerend = value;
              prefs.timerendbool = true;
            });
          });
        }
      },
      sizebutton: 0.9,
      color: prefs.timerendbool ? colorFour : colorThree,
    );
  }

  //----------------------------------------
  Widget _roundedSendInformation(size) {
    return Stack(
      alignment: Alignment.center,
      children: <Widget>[
        Container(
          width: size.width,
          height: size.height * 0.1,
          decoration: BoxDecoration(
            color: colorTwo,
            borderRadius: BorderRadius.only(
                topRight: Radius.circular(20), topLeft: Radius.circular(20)),
          ),
        ),
        RoundedButton(
          text: 'Enviar Formulario',
          textcolor: Colors.white,
          onpress: () {
            setState(() {
              //**** => Reseteo de rpeferencias
              prefs.date = 'Obtener Fecha';
              prefs.datebool = false;
              prefs.timerstart = 'Obtener Hora de Inicio';
              prefs.timerstartbool = false;
              prefs.timerend = 'Obtener Hora de Final';
              prefs.timerendbool = false;
              //**** => Verificacion de variables
              print(asignature);
              print(theme);
              print(quantity);
              print(prefs.date);
              print(prefs.timerstart);
              print(prefs.timerend);
              print(plataform);
              print(advance.toInt());
              print(back);
            });
          },
          sizebutton: 0.9,
          color: colorFive,
        )
      ],
    );
  }

  //----------------------------------------
  Widget _checkForm() {
    return CheckboxForm(
      onChangedFirst: (e) {
        back = e;
      },
      name: 'Respaldo',
    );
  }

  //----------------------------------------
  Widget _getAsignature(BuildContext context, Size size) {
    return FutureBuilder(
      future: materiasProvider.mat(),
      builder: (BuildContext context, AsyncSnapshot<List> snapshot) {
        if (snapshot.hasData) {
          return _dropdownMenuListAsig(snapshot.data, 'Seleccione la Materia');
        } else {
          return Container(
            width: size.width * 0.9,
            height: size.height * 0.1,
            child: Center(
              child: CircularProgressIndicator(),
            ),
          );
        }
      },
    );
  }

  //----------------------------------------
  Widget _getPlataform(BuildContext context, Size size) {
    return FutureBuilder(
      future: plataformProvider.plat(),
      builder: (BuildContext context, AsyncSnapshot<List> snapshot) {
        if (snapshot.hasData) {
          return _dropdownMenuListPlataform(
              snapshot.data, 'Seleccione Plataforma');
        } else {
          return Container(
            width: size.width * 0.9,
            height: size.height * 0.1,
            child: Center(
              child: CircularProgressIndicator(),
            ),
          );
        }
      },
    );
  }
  //----------------------------------------
}
