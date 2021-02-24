import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:send_data_1/constants/constants.dart';

class SliderForm extends StatefulWidget {
  //======================================
  //
  //======================================
  final ValueChanged<double> onChangedFirst;
  final name;
  final double min;
  final double max;
  //----------------------------------------
  SliderForm(
      {@required this.min,
      @required this.max,
      @required this.onChangedFirst,
      this.name});
  //----------------------------------------
  @override
  _SliderFormState createState() => _SliderFormState();
}

class _SliderFormState extends State<SliderForm> {
  //***************************************
  //
  //***************************************
  double rating;
  //----------------------------------------
  @override
  void initState() {
    super.initState();
    rating = 20.0;
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
          Slider(
            value: rating,
            onChanged: (val) {
              setState(() {
                rating = val;
              });
              widget.onChangedFirst(val);
            },
            min: widget.min,
            max: widget.max,
          )
        ],
      ),
    );
  }
}
