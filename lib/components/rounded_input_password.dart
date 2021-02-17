import 'package:flutter/material.dart';
import 'package:send_data_1/components/container_input_field.dart';
import 'package:send_data_1/constants/constants.dart';

class RoundedInputPassword extends StatelessWidget {
  final ValueChanged<String> onchanged;
  final IconData icon;
  final String hinttext;

  const RoundedInputPassword({
    Key key,
    this.onchanged,
    this.icon,
    this.hinttext,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ContainerInputField(
      child: TextField(
        obscureText: true,
        onChanged: onchanged,
        decoration: InputDecoration(
          hintText: hinttext,
          icon: Icon(
            icon,
            color: kPrimaryColor,
          ),
          suffixIcon: Icon(
            Icons.visibility,
            color: kPrimaryColor,
          ),
          border: InputBorder.none,
        ),
      ),
    );
  }
}
