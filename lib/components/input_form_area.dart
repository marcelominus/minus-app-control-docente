import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:send_data_1/components/container_input_text.dart';
import 'package:send_data_1/preference/preferencias_usuario.dart';

class InputFormArea extends StatelessWidget {
  final String name;
  final String hinttext;
  final ValueChanged<String> onchanged;
  final String initial;
  final TextEditingController controller;
  const InputFormArea(
      {Key key,
      this.name,
      this.hinttext,
      this.onchanged,
      this.initial,
      this.controller});

  @override
  Widget build(BuildContext context) {
    final prefs = new PreferenciasUsuario();
    //----------------------------------------
    Size size = MediaQuery.of(context).size;
    //----------------------------------------
    return ContainerInputText(
      child: Column(
        children: <Widget>[
          Container(
            width: size.width * 0.9,
            padding: EdgeInsets.only(top: 5),
            child: Text(
              name,
              textAlign: TextAlign.start,
              style: GoogleFonts.exo2(
                fontSize: 14,
                fontWeight: FontWeight.w500,
                fontStyle: FontStyle.normal,
              ),
            ),
          ),
          TextFormField(
            decoration: InputDecoration(
                hintText: hinttext,
                labelStyle: TextStyle(color: Colors.black),
                border: InputBorder.none),
            obscureText: false,
            maxLines: 3,
            onChanged: onchanged,
            // controller: TextEditingController(text: prefs.theme),
            initialValue: initial,
            controller: controller,
          )
        ],
      ),
    );
  }
}
