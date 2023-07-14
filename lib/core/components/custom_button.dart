import 'package:change30/core/constants/app_contants.dart';
import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final Size size;
  final String buttonText;
  final void Function()? onpress;
  const CustomButton({
    super.key,
    required this.size,
    required this.buttonText,
    this.onpress,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: size.width,
      height: 40,
      child: ElevatedButton(
        onPressed: onpress,
        style: ElevatedButton.styleFrom(
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
            backgroundColor: AppContants.primaryColor),
        child: Text(buttonText, style: smallTitleTextStyle()),
      ),
    );
  }
}
