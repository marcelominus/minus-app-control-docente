import 'package:flutter/material.dart';
import 'package:send_data_1/components/drawer_menu.dart';

class InformationScreen extends StatelessWidget {
  // const InformationScreen({Key key}) : super(key: key);
  static final String routeName = 'information';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Information'),
      ),
      drawer: DrawerMenu(),
      body: Center(
        child: Text('Informacion'),
      ),
    );
  }
}
