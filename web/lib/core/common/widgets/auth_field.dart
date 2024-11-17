import 'package:flutter/material.dart';

class AuthField extends StatelessWidget {
  final String hintText;
  final TextEditingController controller;

  const AuthField(
      {super.key,
      required this.hintText,
      required this.controller});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      decoration: InputDecoration(hintText: hintText),
      controller: controller,
      obscuringCharacter: "*",
      validator: (value) {
        if (value!.isEmpty) {
          return "$hintText is required!";
        }
        return null;
      },
    );
  }
}

class AuthPasswordField extends StatelessWidget {
  final String hintText;
  final bool obscureText;
  final TextEditingController controller;
  final Function(String?) validator;

  const AuthPasswordField(
      {super.key,
      required this.hintText,
      required this.obscureText,
      required this.controller,
      required this.validator});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      decoration: InputDecoration(hintText: hintText),
      controller: controller,
      obscureText: obscureText,
      obscuringCharacter: "*",
      validator: (value) => validator(value)
    );
  }
}
