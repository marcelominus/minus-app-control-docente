import 'package:flutter/material.dart';
import 'package:send_data_1/components/dropdown_generic.dart';
import 'package:send_data_1/components/rounded_button.dart';
import 'package:send_data_1/preference/preferencias_usuario.dart';
import 'package:send_data_1/provider/mat_and_sigle_provider.dart';
import 'package:send_data_1/model/mat_new_model.dart';

class DetailScreen extends StatefulWidget {
  // DetailScreen({Key key}) : super(key: key);
  static final String routeName = 'detail';

  @override
  _DetailScreenState createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {
  String dropdownValue = 'One';
  final prefs = new PreferenciasUsuario();
  final matProvider = new MateriasProviderNew();
  final List<Request> materiasDoc = new List();
  @override
  Widget build(BuildContext context) {
    //======================================
    //Variables Locales
    //======================================
    Size size = MediaQuery.of(context).size; //**** => Tamanio de pantallaS
    //=========================================
    return Scaffold(
      appBar: AppBar(
        title: Text('Detalles'),
      ),
      body: Container(
        width: size.width,
        color: Colors.red[100],
        child: Column(
          children: <Widget>[
            // DropdownGeneric(),
            SizedBox(
              height: 10,
            ),
            DropdownGeneric(
              items: ['2018', '2019', '2020', '2021', '2022', '2023', '2024'],
              onChangedFirst: (e) {},
              name: 'Seleccione un Año',
            ),
            SizedBox(
              height: 15,
            ),
            DropdownGeneric(
              items: [
                'Enero',
                'Febrero',
                'Marzo',
                'Abril',
                'Mayo',
                'Junio',
                'Julio',
                'Agosto',
                'Septiembre',
                'Octubre',
                'Noviembre',
                'Diciembre'
              ],
              onChangedFirst: (e) {},
              name: 'Seleccione un Mes',
            ),
            SizedBox(
              height: 15,
            ),
            RoundedButton(
              onpress: () {},
              text: 'Buscar',
              textcolor: Colors.white,
              sizebutton: 0.9,
            ),
            SizedBox(
              height: 15,
            ),
            _getPlataform(context)
          ],
        ),
      ),
    );
  }

  Widget _getPlataform(BuildContext context) {
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
            width: 20,
            height: 20,
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
            subtitle: Text(e.materia),
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
              Navigator.pushNamed(context, 'detail');
            },
          ),
        ],
      );
    }).toList();
  }
}
