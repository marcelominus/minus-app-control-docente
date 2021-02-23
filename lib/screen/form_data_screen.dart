import 'package:flutter/material.dart';
import 'package:send_data_1/components/camera_form.dart';
import 'package:send_data_1/components/card_title.dart';
import 'package:send_data_1/components/checkbox_form.dart';
import 'package:send_data_1/components/drawer_menu.dart';
import 'package:send_data_1/components/dropdown_menu_list.dart';
import 'package:send_data_1/components/dropdown_menu_plat.dart';
import 'package:send_data_1/components/input_form_area.dart';
import 'package:send_data_1/components/input_form_text.dart';
import 'package:send_data_1/components/rounded_button.dart';
import 'package:send_data_1/components/slider_form.dart';
import 'package:send_data_1/constants/constants.dart';
import 'package:send_data_1/constants/functions.dart';
import 'package:send_data_1/preference/preferencias_usuario.dart';
import 'package:send_data_1/provider/date_provider.dart';
import 'package:send_data_1/provider/materias_provider.dart';
import 'package:send_data_1/provider/plataform_provider.dart';
import 'package:send_data_1/provider/send_provider.dart';
import 'package:send_data_1/provider/timer_provider.dart';

class FormDataScreen extends StatefulWidget {
  //----------------------------------------
  static final String routeName = 'formdata'; //**** => Ruta de acceso de SCREEN

  @override
  _FormDataScreenState createState() => _FormDataScreenState();
}

class _FormDataScreenState extends State<FormDataScreen> {
  //======================================
  //Variables Globales
  //======================================
  final materiasProvider = new MateriasProvider(); //**** => PROVIDERS
  final plataformProvider = new PlataformProvider();
  final dateProvider = new DateProvider();
  final timerProvider = new TimerProvider();
  final sendProvider = new SendProvider();
  final prefs = new PreferenciasUsuario(); //**** => Preferencias
  List<String> materias = ['Seleccione una Materia'];
  //----------------------------------------
  String asignature = ''; //**** => Variables
  String theme = '';
  String quantity = '';
  String plataform = '';
  double advance = 20.0;
  bool back = false;
  String observation = '';
  TextEditingController _controllertheme; //**** => Controllers
  TextEditingController _controlleramount;
  final GlobalKey<FormFieldState> key1 =
      GlobalKey<FormFieldState>(); //**** => Variables para resetear DROPDOWN
  final GlobalKey<FormFieldState> key2 = GlobalKey<FormFieldState>();

  //----------------------------------------
  @override
  void initState() {
    super.initState();
    //***************************************
    //Inicializamos los controller para poder insertar los valores de los PREFS
    //Y procedemos a instanciarlo para mas adelante poder eliminar los valores inscritos
    _controllertheme = new TextEditingController(text: prefs.theme);
    _controlleramount = new TextEditingController(text: prefs.amount);
  }

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
                  prefs.theme = e;
                },
                controller: _controllertheme,
              ),
              space(),
              InputForm(
                name: 'Cantidad de estudiantes.',
                onchanged: (e) {
                  quantity = e;
                  prefs.amount = e;
                },
                controller: _controlleramount,
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
                onchanged: (e) {
                  observation = e;
                },
                initial: '',
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
            showDialog(
              context: context,
              builder: (context) => new AlertDialog(
                title: new Text('Obtener Informacion?'),
                content: new Text(
                    'Presione YES para realizar peticion de información'),
                actions: <Widget>[
                  new FlatButton(
                    onPressed: () => Navigator.of(context).pop(false),
                    child: new Text('No'),
                  ),
                  new FlatButton(
                    onPressed: () {
                      prefs.login = false;
                      Navigator.of(context).pop(false);
                      Navigator.pushNamed(context, 'welcome');
                    },
                    child: new Text('Yes'),
                  ),
                ],
              ),
            );
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
  Widget _dropdownMenuListAsig(List<String> list, String name) {
    return DropdownMenuList(
      name: name,
      items: list,
      onChangedFirst: (val) {
        asignature = val;
      },
      list: key1,
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
  Widget _dropdownMenuListPlataform(List<String> list, String name) {
    return DropdownMenuPlat(
      name: name,
      items: list,
      onChangedFirst: (val) {
        plataform = val;
      },
      plat: key2,
    );
  }

  //----------------------------------------
  Widget _roundedButtonDate() {
    return RoundedButton(
      text: prefs.date,
      textcolor: prefs.datebool ? colorDark : colorLight,
      onpress: () {
        showDialog(
          context: context,
          builder: (context) => new AlertDialog(
            title: new Text('Obtener Informacion?'),
            content:
                new Text('Presione YES para realizar peticion de información'),
            actions: <Widget>[
              new FlatButton(
                onPressed: () => Navigator.of(context).pop(false),
                child: new Text('No'),
              ),
              new FlatButton(
                onPressed: () {
                  if (prefs.datebool == false) {
                    dateProvider.date().then((value) {
                      setState(() {
                        prefs.date = value;
                        prefs.datebool = true;
                      });
                    });
                  }
                  Navigator.of(context).pop(false);
                },
                child: new Text('Yes'),
              ),
            ],
          ),
        );
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
        showDialog(
          context: context,
          builder: (context) => new AlertDialog(
            title: new Text('Obtener Informacion?'),
            content:
                new Text('Presione YES para realizar peticion de información'),
            actions: <Widget>[
              new FlatButton(
                onPressed: () => Navigator.of(context).pop(false),
                child: new Text('No'),
              ),
              new FlatButton(
                onPressed: () {
                  if (prefs.timerstartbool == false) {
                    timerProvider.start().then((value) {
                      setState(() {
                        prefs.timerstart = value;
                        prefs.timerstartbool = true;
                      });
                    });
                  }
                  Navigator.of(context).pop(false);
                },
                child: new Text('Yes'),
              ),
            ],
          ),
        );
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
        showDialog(
          context: context,
          builder: (context) => new AlertDialog(
            title: new Text('Obtener Informacion?'),
            content:
                new Text('Presione YES para realizar peticion de información'),
            actions: <Widget>[
              new FlatButton(
                onPressed: () => Navigator.of(context).pop(false),
                child: new Text('No'),
              ),
              new FlatButton(
                onPressed: () {
                  if (prefs.timerendbool == false) {
                    timerProvider.end().then((value) {
                      setState(() {
                        prefs.timerend = value;
                        prefs.timerendbool = true;
                      });
                    });
                  }
                  Navigator.of(context).pop(false);
                },
                child: new Text('Yes'),
              ),
            ],
          ),
        );
      },
      sizebutton: 0.9,
      color: prefs.timerendbool ? colorFour : colorThree,
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
              bool dates = _verificationDate(
                prefs.asignature,
                prefs.theme,
                prefs.amount,
                prefs.date,
                prefs.timerstart,
                prefs.timerend,
                plataform,
                prefs.photo,
              );
              if (dates == true) {
                Functions().toastAlert('Datos vacios Revise el Formulario');
              } else {
                sendProvider
                    .send(
                        prefs.asignature,
                        prefs.theme,
                        prefs.amount,
                        prefs.date,
                        prefs.timerstart,
                        plataform,
                        advance,
                        back,
                        prefs.timerend,
                        prefs.photo,
                        observation,
                        prefs.carnet)
                    .then((value) {
                  if (value == 'correcto') {
                    _resetVar();
                    Functions().toastSuccess('Correcto Datos Enviados');
                  } else {
                    Functions()
                        .toastError('Ocurrio un error intente mas tarde');
                  }
                });
              }
            });
          },
          sizebutton: 0.9,
          color: colorFive,
        )
      ],
    );
  }

  //----------------------------------------
  bool _verificationDate(
    String asignature,
    String theme,
    String quantity,
    String date,
    String timerstart,
    String timerend,
    String plataform,
    String photo,
  ) {
    if (prefs.asignature == '' ||
        prefs.asignature == 'Seleccione una Opcion' ||
        plataform == '' ||
        plataform == 'Seleccione una Opcion' ||
        prefs.theme == '' ||
        prefs.amount == '' ||
        date == 'Obtener Fecha' ||
        timerstart == 'Obtener Hora de Inicio' ||
        timerend == 'Obtener Hora de Final' ||
        photo == 'empty') {
      return true;
    } else {
      return false;
    }
  }

  //----------------------------------------
  void _resetVar() {
    setState(() {
      asignature = 'Seleccione una Opcion';
      plataform = 'Seleccione una Opcion';
      theme = '';
      quantity = '';
      //**** => Reseteo de rpeferencias
      prefs.date =
          'Obtener Fecha'; //**** => Reinicamos las variables de PREFERENCES
      prefs.datebool = false;
      prefs.timerstart = 'Obtener Hora de Inicio';
      prefs.timerstartbool = false;
      prefs.timerend = 'Obtener Hora de Final';
      prefs.timerendbool = false;
      prefs.photo = 'empty';
      prefs.photobool = false;
      prefs.theme = '';
      prefs.amount = '';
      _controllertheme
          .clear(); //**** => Reiniciamos los valores de los dos campos
      _controlleramount.clear();
      key2.currentState.reset(); //**** => Reinicamos los valores de Dropdown
    });
  }

  //----------------------------------------
  void _showDialog() {
    // flutter defined function
    showDialog(
      context: context,
      builder: (BuildContext context) {
        // return object of type Dialog
        return AlertDialog(
          title: new Text("Alert Dialog title"),
          content: new Text("Alert Dialog body"),
          actions: <Widget>[
            // usually buttons at the bottom of the dialog
            new FlatButton(
              child: new Text("Close"),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }
}
