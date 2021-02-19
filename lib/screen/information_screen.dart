import 'package:flutter/material.dart';
import 'package:send_data_1/components/drawer_menu.dart';
import 'package:send_data_1/preference/preferencias_usuario.dart';

class InformationScreen extends StatelessWidget {
  // const InformationScreen({Key key}) : super(key: key);
  static final String routeName = 'information';
  final prefs = new PreferenciasUsuario();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Information'),
        actions: <Widget>[
          Padding(
              padding: EdgeInsets.only(right: 20.0, top: 20.0),
              child: GestureDetector(
                onTap: () {
                  prefs.login = false;
                  Navigator.pushNamed(context, 'welcome');
                },
                child: Text('Cerrar Sesión'),
              )),
        ],
      ),
      drawer: DrawerMenu(),
      body: Center(
        child: Text('Informacion'),
      ),
    );
  }
}
