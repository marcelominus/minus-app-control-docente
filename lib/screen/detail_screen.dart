import 'package:date_time_picker/date_time_picker.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:send_data_1/components/container_input_text.dart';
import 'package:send_data_1/components/dropdown_generic.dart';
import 'package:send_data_1/components/rounded_button.dart';
import 'package:send_data_1/constants/constants.dart';
import 'package:send_data_1/constants/functions.dart';
import 'package:send_data_1/preference/preferencias_usuario.dart';
import 'package:send_data_1/provider/detail_provider.dart';
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
  bool busqueda = false;
  String valorDate = '';
  final prefs = new PreferenciasUsuario();
  final matProvider = new MateriasProviderNew();
  final detailProvider = new DetailProviderNew();
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
        title: Text(prefs.siglasearch),
      ),
      body: SingleChildScrollView(
        child: Container(
          width: size.width,
          color: colorLight,
          child: Column(
            children: <Widget>[
              // DropdownGeneric(),
              SizedBox(
                height: 10,
              ),
              ContainerInputText(
                child: DateTimePicker(
                  initialValue: '',
                  dateMask: 'MM/dd/yyyy',
                  firstDate: DateTime(2000),
                  lastDate: DateTime(2100),
                  dateLabelText: 'Ingrese la Fecha a Buscar',
                  onChanged: (val) {
                    valorDate = val;
                    setState(() {
                      busqueda = false;
                    });
                  },
                  validator: (val) {
                    print(val);
                    return null;
                  },
                ),
              ),

              SizedBox(
                height: 15,
              ),
              RoundedButton(
                onpress: () {
                  print(valorDate);
                  if (valorDate == '') {
                    print('Se se tiene datos');
                    Functions().toastAlert('Selecciones una Fecha de Busqueda');
                  } else {
                    List valor = valorDate.split('-');
                    String valor1 = int.parse(valor[0]).toString();
                    String valor2 = int.parse(valor[1]).toString();
                    String valor3 = int.parse(valor[2]).toString();
                    String valEnd = valor2 + '/' + valor3 + '/' + valor1;

                    prefs.datesearch = valEnd;
                    print(prefs.datesearch);
                    detailProvider.fech();
                    setState(() {
                      busqueda = true;
                    });
                    // if (prefs.datesearch != '') {
                  }
                  // }
                },
                text: 'Buscar',
                textcolor: Colors.white,
                sizebutton: 0.9,
              ),
              SizedBox(
                height: 15,
              ),
              Container(
                child: busqueda
                    ? _getPlataform(context, size)
                    : Text('No existe datos'),
              )
              // _getPlataform(context)
            ],
          ),
        ),
      ),
    );
  }

  Widget _getPlataform(BuildContext context, size) {
    return FutureBuilder(
      future: detailProvider.fech(),
      builder: (BuildContext context, AsyncSnapshot<List> snapshot) {
        if (snapshot.hasData) {
          return Container(
            child: Column(
              children: _crearLista(snapshot.data, context, size),
            ),
          );
        } else {
          return Container(
            width: size.width,
            height: size.height * 0.4,
            child: Center(
              child: CircularProgressIndicator(),
            ),
          );
        }
      },
    );
  }

  List<Widget> _crearLista(opciones, BuildContext context, size) {
    return opciones.map<Widget>((e) {
      return Column(
        children: <Widget>[
          Card(
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
            margin: EdgeInsets.all(5),
            elevation: 10,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(30),
              child: Row(
                children: <Widget>[
                  Container(
                    width: size.width * 0.35,
                    child: FadeInImage(
                      // En esta propiedad colocamos la imagen a descargar
                      image: NetworkImage('${e.foto}'),
                      placeholder: AssetImage('lib/assets/img/jar-loading.gif'),
                      fit: BoxFit.cover,
                      height: 260,
                    ),
                  ),
                  Container(
                    width: size.width * 0.62,
                    height: 260,
                    padding: EdgeInsets.all(10.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          e.materia,
                          style: GoogleFonts.exo2(
                            fontSize: 20,
                            fontWeight: FontWeight.w700,
                            fontStyle: FontStyle.normal,
                          ),
                        ),
                        SizedBox(
                          height: 5.0,
                        ),
                        Text(
                          'Tema avanzado : ${e.titulo}',
                          style: GoogleFonts.exo2(
                              fontSize: 13,
                              fontWeight: FontWeight.w300,
                              fontStyle: FontStyle.italic),
                        ),
                        SizedBox(
                          height: 5.0,
                        ),
                        Text(
                          'Fecha : ${e.fecha}',
                          style: GoogleFonts.exo2(
                              fontSize: 13,
                              fontWeight: FontWeight.w300,
                              fontStyle: FontStyle.italic),
                        ),
                        SizedBox(
                          height: 5.0,
                        ),
                        Text(
                          'Hora inicial : ${e.horaini}',
                          style: GoogleFonts.exo2(
                              fontSize: 13,
                              fontWeight: FontWeight.w300,
                              fontStyle: FontStyle.italic),
                        ),
                        SizedBox(
                          height: 5.0,
                        ),
                        Text(
                          'Hora final : ${e.horafin}',
                          style: GoogleFonts.exo2(
                              fontSize: 13,
                              fontWeight: FontWeight.w300,
                              fontStyle: FontStyle.italic),
                        ),
                        SizedBox(
                          height: 5.0,
                        ),
                        Text(
                          'Cantidad : ${e.cantidad}',
                          style: GoogleFonts.exo2(
                              fontSize: 13,
                              fontWeight: FontWeight.w300,
                              fontStyle: FontStyle.italic),
                        ),
                        SizedBox(
                          height: 5.0,
                        ),
                        Text(
                          'Avance : ${e.avance}',
                          style: GoogleFonts.exo2(
                              fontSize: 13,
                              fontWeight: FontWeight.w300,
                              fontStyle: FontStyle.italic),
                        ),
                        SizedBox(
                          height: 5.0,
                        ),
                        Text(
                          'Plataforma : ${e.plataforma}',
                          style: GoogleFonts.exo2(
                              fontSize: 13,
                              fontWeight: FontWeight.w300,
                              fontStyle: FontStyle.italic),
                        ),
                        SizedBox(
                          height: 5.0,
                        ),
                        Text(
                          'Observaciones : ${e.observacion}',
                          style: GoogleFonts.exo2(
                              fontSize: 13,
                              fontWeight: FontWeight.w300,
                              fontStyle: FontStyle.italic),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
          )
        ],
      );
    }).toList();
  }
}
