import 'package:change30/src/core/constants/app_contants.dart';
import 'package:flutter/material.dart';

class AppTitleWidget extends StatelessWidget {
  final String title1;
  final String title2;
  final double padding;
  const AppTitleWidget({
    super.key,
    this.title1 = "STAY",
    this.title2 = "HARD",
    this.padding = 5,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(title1,
            style: Theme.of(context)
                .textTheme
                .headlineMedium
                ?.copyWith(color: Colors.black, fontWeight: FontWeight.bold)),
        Padding(
          padding: EdgeInsets.only(left: padding),
          child: Text(title2,
              style: /* Theme.of(context).textTheme.headlineMedium?.copyWith(
                color: Colors.amber.shade900, fontWeight: FontWeight.bold) */
                  const TextStyle(color: AppConstants.primaryColor)),
        ),
      ],
    );
  }
}
