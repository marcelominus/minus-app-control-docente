import 'package:flutter/material.dart';
import 'package:send_data_1/constants/constants.dart';

class ContainerInputText extends StatelessWidget {
  final Widget child;
  const ContainerInputText({
    Key key,
    this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    //========================================
    Size size = MediaQuery.of(context).size;
    //=========================================
    return Container(
      width: size.width * 0.9,
      decoration: BoxDecoration(
        color: colorLight,
        borderRadius: BorderRadius.circular(15.0),
        border: Border.all(color: colorDark, width: 1),
        boxShadow: [
          BoxShadow(
            color: colorDark.withOpacity(0.5),
            spreadRadius: 4,
            blurRadius: 7,
            offset: Offset(0, 1), // changes position of shadow
          ),
        ],
      ),
      padding: EdgeInsets.symmetric(horizontal: 10.0),
      child: child,
    );
  }
}
