import 'package:flutter/material.dart';
import 'package:send_data_1/components/container_input_field.dart';
import 'package:send_data_1/constants/constants.dart';

class RoundedInputText extends StatelessWidget {
  final ValueChanged<String> onchanged;
  final IconData icon;
  final String hinttext;

  const RoundedInputText({
    Key key,
    this.onchanged,
    this.icon,
    this.hinttext,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ContainerInputField(
      child: TextField(
        onChanged: onchanged,
        decoration: InputDecoration(
          hintText: hinttext,
          icon: Icon(
            icon,
            color: kPrimaryColor,
          ),
          border: InputBorder.none,
        ),
      ),
    );
  }
}
