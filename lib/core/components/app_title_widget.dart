import 'package:change30/core/constants/app_contants.dart';
import 'package:flutter/material.dart';

class AppTitleWidget extends StatelessWidget {
  const AppTitleWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text("STAY",
            style: /* Theme.of(context)
              .textTheme
              .headlineMedium
              ?.copyWith(color: Colors.black, fontWeight: FontWeight.bold) */
                bigtitleTextStyle(Colors.black)),
        Padding(
          padding: const EdgeInsets.only(left: 5),
          child: Text("HARD",
              style: /* Theme.of(context).textTheme.headlineMedium?.copyWith(
                color: Colors.amber.shade900, fontWeight: FontWeight.bold) */
                  bigtitleTextStyle(AppConstants.primaryColor)),
        ),
      ],
    );
  }
}
