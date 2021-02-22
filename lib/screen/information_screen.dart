import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:send_data_1/components/drawer_menu.dart';
import 'package:send_data_1/preference/preferencias_usuario.dart';

class InformationScreen extends StatelessWidget {
  // const InformationScreen({Key key}) : super(key: key);
  static final String routeName = 'information';
  final prefs = new PreferenciasUsuario();

  @override
  Widget build(BuildContext context) {
    Future<bool> _onWillPop() async {
      return (await showDialog(
            context: context,
            builder: (context) => new AlertDialog(
              title: new Text('Are you sure?'),
              content: new Text('Do you want to exit an App'),
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
      ),
    );
  }
}
