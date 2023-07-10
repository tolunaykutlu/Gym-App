import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final Size size;
  final String buttonText;
  const CustomButton({
    super.key,
    required this.size,
    required this.buttonText,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: size.width,
      height: 40,
      child: ElevatedButton(
        onPressed: () {},
        style: ElevatedButton.styleFrom(
            shape:
                BeveledRectangleBorder(borderRadius: BorderRadius.circular(12)),
            backgroundColor: const Color(0xffF54242)),
        child: Text(buttonText),
      ),
    );
  }
}
