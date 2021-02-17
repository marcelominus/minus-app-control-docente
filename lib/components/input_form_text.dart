import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:send_data_1/components/container_input_text.dart';

class InputForm extends StatelessWidget {
  final String name;
  const InputForm({
    Key key,
    this.name,
  }) : super(key: key);

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
            style: TextStyle(
              fontSize: 14,
            ),
            decoration: InputDecoration(
              hintText: "Ingrese la cantidad de estudiantes",
              labelStyle: TextStyle(color: Colors.black, fontSize: 15),
              border: InputBorder.none,
              icon: Icon(Icons.person),
            ),
            keyboardType: TextInputType.number,
          )
        ],
      ),
    );
  }
}
