import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:send_data_1/constants/constants.dart';

class CheckboxForm extends StatefulWidget {
  //======================================
  //
  //======================================
  final String name;
  final ValueChanged<bool> onChangedFirst;
  //----------------------------------------
  CheckboxForm({@required this.onChangedFirst, this.name});
  //----------------------------------------
  @override
  _CheckboxFormState createState() => _CheckboxFormState();
}

class _CheckboxFormState extends State<CheckboxForm> {
  //***************************************
  //
  //***************************************
  bool _check;
  //----------------------------------------
  @override
  void initState() {
    super.initState();
    _check = false;
  }

  //----------------------------------------
  @override
  Widget build(BuildContext context) {
    //----------------------------------------
    Size size = MediaQuery.of(context).size;
    //----------------------------------------
    return Container(
      width: size.width * 0.9,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15.0),
        color: colorLight,
        boxShadow: [
          BoxShadow(
            color: colorDark.withOpacity(0.5),
            spreadRadius: 4,
            blurRadius: 7,
            offset: Offset(0, 1), // changes position of shadow
          ),
        ],
      ),
      child: Column(
        children: <Widget>[
          Container(
            width: size.width * 0.9,
            padding: EdgeInsets.only(top: 5, left: 15),
            child: Text(
              widget.name,
              textAlign: TextAlign.start,
              style: GoogleFonts.exo2(
                fontSize: 14,
                fontWeight: FontWeight.w500,
                fontStyle: FontStyle.normal,
              ),
            ),
          ),
          CheckboxListTile(
              title: Text('(Enviar un email a mi correo)'),
              value: _check,
              onChanged: (bool value) {
                setState(() {
                  _check = value;
                });
                widget.onChangedFirst(value);
              })
        ],
      ),
    );
  }
}
