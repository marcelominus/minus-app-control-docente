import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:send_data_1/constants/constants.dart';

class RoundedButton extends StatelessWidget {
  final String text;
  final Function onpress;
  final Color color, textcolor;
  final double sizebutton;
  const RoundedButton({
    Key key,
    this.text,
    this.onpress,
    this.color = colorThree,
    this.textcolor = Colors.black,
    this.sizebutton = 0.8,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      width: size.width * sizebutton,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(30.0),
        boxShadow: [
          BoxShadow(
            color: colorDark.withOpacity(0.5),
            spreadRadius: 3,
            blurRadius: 7,
            offset: Offset(0, 1), // changes position of shadow
          ),
        ],
      ),
      child: ClipRRect(
        child: FlatButton(
          padding: EdgeInsets.symmetric(vertical: size.height * 0.025),
          shape: StadiumBorder(),
          onPressed: onpress,
          child: Text(
            text,
            style: GoogleFonts.exo2(
                fontSize: 16,
                fontWeight: FontWeight.w500,
                fontStyle: FontStyle.normal,
                color: colorLight),
          ),
          color: color,
        ),
      ),
    );
  }
}
