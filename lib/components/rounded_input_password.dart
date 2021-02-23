import 'package:flutter/material.dart';
import 'package:send_data_1/components/container_input_field.dart';
import 'package:send_data_1/constants/constants.dart';

class RoundedInputPassword extends StatelessWidget {
  //----------------------------------------
  final ValueChanged<String> onchanged;
  final IconData icon;
  final String hinttext;
  final Function onpressed;
  final bool obscuretext;
  final TextEditingController controller;

  //----------------------------------------
  const RoundedInputPassword({
    Key key,
    this.onchanged,
    this.icon,
    this.hinttext,
    this.onpressed,
    this.obscuretext,
    this.controller,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ContainerInputField(
      child: TextFormField(
        controller: controller,
        obscureText: obscuretext,
        onChanged: onchanged,
        decoration: InputDecoration(
          hintText: hinttext,
          icon: Icon(
            icon,
            color: kPrimaryColor,
          ),
          suffixIcon: IconButton(
            icon: Icon(Icons.visibility),
            color: kPrimaryColor,
            onPressed: onpressed,
          ),
          border: InputBorder.none,
        ),
      ),
    );
  }
}
