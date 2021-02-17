import 'package:flutter/material.dart';

class DrawerMenu extends StatelessWidget {
  const DrawerMenu({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          DrawerHeader(
            child: Container(),
            decoration: BoxDecoration(
                image: DecorationImage(
              image: AssetImage('lib/assets/img/menu-img.jpg'),
              fit: BoxFit.cover,
            )),
          ),
          ListTile(
            leading: Icon(
              Icons.party_mode,
              color: Colors.blue,
            ),
            title: Text('Formulario'),
            onTap: () {
              Navigator.pushReplacementNamed(context, 'formdata');
            },
          ),
          ListTile(
            leading: Icon(
              Icons.people,
              color: Colors.blue,
            ),
            title: Text('Informacion'),
            onTap: () {
              Navigator.pushReplacementNamed(context, 'information');
            },
          )
        ],
      ),
    );
  }
}
