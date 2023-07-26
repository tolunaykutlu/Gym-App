import 'package:change30/src/core/constants/app_contants.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomTextFormField extends StatefulWidget {
  final TextEditingController control;
  final String hintText;
  final bool secret;
  final Widget? sufIcon;
  final String? errorText;
  final String? Function(String?)? validator;
  final void Function(String)? onChanged;
  final AutovalidateMode autovalidateMode;

  const CustomTextFormField({
    super.key,
    required this.control,
    required this.hintText,
    this.secret = false,
    this.sufIcon,
    this.errorText,
    this.validator,
    this.onChanged,
    this.autovalidateMode = AutovalidateMode.disabled,
  });

  @override
  State<CustomTextFormField> createState() => _CustomTextFormFieldState();
}

class _CustomTextFormFieldState extends State<CustomTextFormField> {
  @override
  Widget build(BuildContext context) {
    return TextFormField(
        autovalidateMode: widget.autovalidateMode,
        validator: widget.validator,
        style: GoogleFonts.orbitron(fontWeight: FontWeight.bold),
        controller: widget.control,
        obscureText: widget.secret,
        cursorColor: Colors.black,
        decoration: InputDecoration(
            errorStyle: Theme.of(context).textTheme.titleMedium,
            errorText: widget.errorText,
            suffixIcon: widget.sufIcon,
            fillColor: AppConstants.secondaryColor,
            filled: true,
            hintText: widget.hintText,
            border: OutlineInputBorder(
                borderSide: BorderSide.none,
                borderRadius: BorderRadius.circular(5))));
  }
}
