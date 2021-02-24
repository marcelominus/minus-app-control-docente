import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:send_data_1/constants/constants.dart';

class CardTitle extends StatelessWidget {
  final String text;
  const CardTitle({Key key, this.text}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Card(
      elevation: 20,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      color: colorFive,
      child: Row(
        children: <Widget>[
          Container(
            width: size.width * 0.35,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: Image(
                image: AssetImage('lib/assets/img/artificial.jpg'),
              ),
            ),
          ),
          Container(
            width: size.width * 0.62,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(
                  'Bienvenido',
                  style: GoogleFonts.exo2(
                      fontSize: 20,
                      fontWeight: FontWeight.w700,
                      fontStyle: FontStyle.normal,
                      color: colorLight),
                ),
                SizedBox(
                  height: 10.0,
                ),
                Text(
                  text,
                  style: GoogleFonts.exo2(
                      fontSize: 16,
                      fontWeight: FontWeight.w300,
                      fontStyle: FontStyle.italic,
                      color: colorLight),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
