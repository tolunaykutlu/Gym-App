import 'package:flutter/material.dart';

displayMessage(BuildContext context, String message) {
  return showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          content: Text(message),
        );
      });
}
