import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:send_data_1/components/container_input_text.dart';

class InputFormArea extends StatelessWidget {
  final String name;
  final String hinttext;
  const InputFormArea({Key key, this.name, this.hinttext});

  @override
  Widget build(BuildContext context) {
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
          TextField(
            decoration: InputDecoration(
                hintText: hinttext,
                labelStyle: TextStyle(color: Colors.black),
                border: InputBorder.none),
            obscureText: false,
            maxLines: 3,
          )
        ],
      ),
    );
  }
}
