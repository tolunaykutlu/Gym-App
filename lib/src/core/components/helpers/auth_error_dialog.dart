import 'package:change30/src/core/constants/app_contants.dart';
import 'package:flutter/material.dart';

displayMessage(BuildContext context, String message) {
  return showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          backgroundColor: const Color.fromARGB(255, 236, 236, 236),
          shape: ContinuousRectangleBorder(
              borderRadius: BorderRadius.circular(15)),
          content: Text(
            message,
            style: AppConstants.smallTitleTextStyle(fsize: 15),
          ),
        );
      });
}
