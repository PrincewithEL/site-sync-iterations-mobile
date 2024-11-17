import 'package:flutter/material.dart';

class InputField extends StatelessWidget {
  final String hintText;
  final bool obscureText;
  final TextEditingController controller;

  const InputField({
    super.key,
    required this.hintText,
    this.obscureText = false,
    required this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      decoration: InputDecoration(
        hintText: hintText,
      ),
      controller: controller,
      obscureText: obscureText,
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
