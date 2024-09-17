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
  final bool autoFocus;
  final String? labeltext;

  const CustomTextFormField({
    super.key,
    required this.control,
    required this.hintText,
    this.secret = false,
    this.sufIcon,
    this.errorText,
    this.validator,
    this.onChanged,
    this.autoFocus = false,
    this.labeltext,
  });

  @override
  State<CustomTextFormField> createState() => _CustomTextFormFieldState();
}

class _CustomTextFormFieldState extends State<CustomTextFormField> {
  @override
  Widget build(BuildContext context) {
    return TextFormField(
        autofocus: widget.autoFocus,
        autovalidateMode: AutovalidateMode.onUserInteraction,
        validator: widget.validator,
        style: GoogleFonts.orbitron(fontWeight: FontWeight.bold),
        controller: widget.control,
        obscureText: widget.secret,
        cursorColor: Colors.black,
        decoration: InputDecoration(
<<<<<<< Updated upstream
=======
            labelStyle: AppConstants.smallTitleTextStyle(
                color: Colors.black, fsize: 17),
>>>>>>> Stashed changes
            labelText: widget.labeltext,
            errorStyle: Theme.of(context)
                .textTheme
                .titleMedium
                ?.copyWith(color: AppConstants.primaryColor),
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
