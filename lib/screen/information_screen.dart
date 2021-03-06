import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:send_data_1/components/drawer_menu.dart';
import 'package:send_data_1/constants/constants.dart';
import 'package:send_data_1/model/mat_new_model.dart';
import 'package:send_data_1/preference/preferencias_usuario.dart';
import 'package:send_data_1/provider/mat_and_sigle_provider.dart';

class InformationScreen extends StatelessWidget {
  // const InformationScreen({Key key}) : super(key: key);
  static final String routeName = 'information';
  final prefs = new PreferenciasUsuario();
  final matProvider = new MateriasProviderNew();
  final List<Request> materiasDoc = new List();
  @override
  Widget build(BuildContext context) {
    Future<bool> _onWillPop() async {
      return (await showDialog(
            context: context,
            builder: (context) => new AlertDialog(
              title: new Text('Salir'),
              content: new Text('Esta seguro de salir de la aplicación'),
              actions: <Widget>[
                new FlatButton(
                  onPressed: () => Navigator.of(context).pop(false),
                  child: new Text('No'),
                ),
                new FlatButton(
                  onPressed: () {
                    SystemChannels.platform.invokeMethod('SystemNavigator.pop');
                    // Future.delayed(const Duration(milliseconds: 1000), () {
                    //   exit(0);
                    // });
                  },
                  child: new Text('Yes'),
                ),
              ],
            ),
          )) ??
          false;
    }

    return new WillPopScope(
      onWillPop: _onWillPop,
      child: new Scaffold(
        appBar: AppBar(
          title: Text('Information'),
          actions: <Widget>[_closeSession(context)],
          backgroundColor: colorSix,
        ),
        drawer: DrawerMenu(),
        body: _getPlataform(context),
      ),
    );
  }

  Widget _getPlataform(BuildContext context) {
    //======================================
    //Variables Locales
    //======================================
    Size size = MediaQuery.of(context).size; //**** => Tamanio de pantallaS
    //=========================================
    return FutureBuilder(
      future: matProvider.mat(),
      builder: (BuildContext context, AsyncSnapshot<List> snapshot) {
        if (snapshot.hasData) {
          return Container(
            child: Column(
              children: _crearLista(snapshot.data, context),
            ),
          );
        } else {
          return Container(
            width: size.width,
            height: size.height * 0.5,
            child: Center(
              child: CircularProgressIndicator(),
            ),
          );
        }
      },
    );
  }

  List<Widget> _crearLista(opciones, BuildContext context) {
    return opciones.map<Widget>((e) {
      return Column(
        children: <Widget>[
          ListTile(
            title: Text(e.sigla),
            subtitle: Text(e.materia, overflow: TextOverflow.ellipsis),
            leading: FadeInImage(
              placeholder: AssetImage('lib/assets/img/jar-loading.gif'),
              image: NetworkImage(
                  'https://previews.123rf.com/images/vectorikart/vectorikart1312/vectorikart131200010/24633545-ilustraci%C3%B3n-conceptual-de-un-equipo-de-profesores-con-iconos-de-educaci%C3%B3n-en-hex%C3%A1gonos.jpg'),
              fadeInDuration: Duration(
                milliseconds: 500,
              ),
              height: 300.0,
              fit: BoxFit.cover,
            ),
            trailing: Icon(Icons.arrow_forward_ios),
            onTap: () {
              prefs.siglasearch = e.sigla;
              Navigator.pushNamed(context, 'detail');
            },
          ),
        ],
      );
    }).toList();
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
                      Navigator.pushNamedAndRemoveUntil(
                          context, 'welcome', (e) => false);
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
}
