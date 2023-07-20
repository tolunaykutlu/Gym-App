import 'package:change30/src/core/constants/app_contants.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomTextField extends StatelessWidget {
  final TextEditingController control;
  final String hintText;
  final bool secret;
  final Widget? sufIcon;
  final String? errorText;

  const CustomTextField({
    super.key,
    required this.control,
    required this.hintText,
    this.secret = false,
    this.sufIcon,
    this.errorText,
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
        style: GoogleFonts.orbitron(fontWeight: FontWeight.bold),
        controller: control,
        obscureText: secret,
        cursorColor: Colors.black,
        decoration: InputDecoration(
            errorText: errorText,
            suffixIcon: sufIcon,
            fillColor: AppConstants.secondaryColor,
            filled: true,
            hintText: hintText,
            border: OutlineInputBorder(
                borderSide: BorderSide.none,
                borderRadius: BorderRadius.circular(5))));
  }
}
