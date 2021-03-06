import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:send_data_1/constants/constants.dart';
import 'package:send_data_1/preference/preferencias_usuario.dart';

class DropdownGeneric extends StatefulWidget {
  final List<String> items;
  final ValueChanged<String> onChangedFirst;
  final String name;
  final GlobalKey<FormFieldState> date;
  DropdownGeneric({
    @required this.name,
    @required this.items,
    @required this.onChangedFirst,
    this.date,
  });
  //===============================

  @override
  _DropdownGenericState createState() => _DropdownGenericState();
}

class _DropdownGenericState extends State<DropdownGeneric> {
  String selectedKey;
  final prefs = new PreferenciasUsuario();

  @override
  void initState() {
    super.initState();
    selectedKey = widget.items.first;
  }

  @override
  Widget build(BuildContext context) {
    //----------------------------------------
    Size size = MediaQuery.of(context).size;
    //----------------------------------------
    return Container(
        width: size.width * 0.9,
        height: size.height * 0.1,
        padding: EdgeInsets.symmetric(horizontal: 15.0),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15.0),
          boxShadow: [
            BoxShadow(
              color: colorFour.withOpacity(0.5),
              spreadRadius: 4,
              blurRadius: 7,
              offset: Offset(0, 1),
            ),
          ],
          color: colorLight,
        ),
        child: Column(
          children: <Widget>[
            Container(
              width: size.width * 0.9,
              padding: EdgeInsets.only(top: 5),
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
            DropdownButtonFormField<String>(
              key: widget.date,
              onTap: () {
                FocusScope.of(context).requestFocus(new FocusNode());
              },
              items: widget.items.map((e) {
                return DropdownMenuItem<String>(
                  child: Text(
                    e,
                    overflow: TextOverflow.ellipsis,
                  ),
                  value: e,
                );
              }).toList(),
              onChanged: (val) {
                setState(() {
                  selectedKey = val;
                });
                widget.onChangedFirst(val);
              },
              value: selectedKey,
              decoration: InputDecoration(enabledBorder: InputBorder.none),
            ),
          ],
        ));
  }
}
