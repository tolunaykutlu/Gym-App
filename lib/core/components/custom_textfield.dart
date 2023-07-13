import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  final TextEditingController control;
  final String hintText;
  final bool secret;
  final Widget? sufIcon;

  const CustomTextField({
    super.key,
    required this.control,
    required this.hintText,
    this.secret = false,
    this.sufIcon,
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
        style: const TextStyle(fontWeight: FontWeight.bold),
        controller: control,
        obscureText: secret,
        cursorColor: Colors.black,
        decoration: InputDecoration(
            suffixIcon: sufIcon,
            fillColor: Colors.white,
            filled: true,
            hintText: hintText,
            border: OutlineInputBorder(
                borderSide: BorderSide.none,
                borderRadius: BorderRadius.circular(5))));
  }
}
