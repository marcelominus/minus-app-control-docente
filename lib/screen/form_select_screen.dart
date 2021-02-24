import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:send_data_1/screen/form_data_screen.dart';

class FormSelectScreen extends StatefulWidget {
  // FormSelectScreen({Key key}) : super(key: key);
  static final String routeName = 'formselect';

  @override
  _FormSelectScreenState createState() => _FormSelectScreenState();
}

class _FormSelectScreenState extends State<FormSelectScreen> {
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
      child: new FormDataScreen(),
    );
  }
}
