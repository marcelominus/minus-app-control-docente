import 'package:flutter/material.dart';
import 'package:send_data_1/constants/constants.dart';

class ContainerInputField extends StatelessWidget {
  final Widget child;
  const ContainerInputField({
    Key key,
    this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Container(
      width: size.width * 0.8,
      decoration: BoxDecoration(
        color: colorLight,
        borderRadius: BorderRadius.circular(15.0),
        border: Border.all(color: colorFour, width: 1),
        boxShadow: [
          BoxShadow(
            color: colorFour.withOpacity(0.5),
            spreadRadius: 4,
            blurRadius: 7,
            offset: Offset(0, 1), // changes position of shadow
          ),
        ],
      ),
      padding: EdgeInsets.symmetric(vertical: 5, horizontal: 5),
      child: child,
    );
  }
}
