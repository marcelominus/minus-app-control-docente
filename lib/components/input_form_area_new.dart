import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:send_data_1/components/container_input_text.dart';

class InputFormAreaNew extends StatefulWidget {
  final String name;
  final String hinttext;
  final ValueChanged<String> onchanged;
  InputFormAreaNew({Key key, this.name, this.hinttext, this.onchanged})
      : super(key: key);

  @override
  _InputFormAreaNewState createState() => _InputFormAreaNewState();
}

class _InputFormAreaNewState extends State<InputFormAreaNew> {
  final FocusNode _passwordEmail = FocusNode();
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
              widget.name,
              textAlign: TextAlign.start,
              style: GoogleFonts.exo2(
                fontSize: 14,
                fontWeight: FontWeight.w500,
                fontStyle: FontStyle.normal,
              ),
            ),
          ),
          TextField(
            focusNode: _passwordEmail,
            decoration: InputDecoration(
                hintText: widget.hinttext,
                labelStyle: TextStyle(color: Colors.black),
                border: InputBorder.none),
            obscureText: false,
            maxLines: 3,
            onChanged: widget.onchanged,
          )
        ],
      ),
    );
  }
}
