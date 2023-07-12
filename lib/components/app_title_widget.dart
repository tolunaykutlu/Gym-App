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
        Text(
          "CHANGE ",
          style: Theme.of(context)
              .textTheme
              .headlineMedium
              ?.copyWith(color: Colors.black, fontWeight: FontWeight.bold),
        ),
        Text(
          "30",
          style: Theme.of(context).textTheme.headlineMedium?.copyWith(
              color: Colors.amber.shade900, fontWeight: FontWeight.bold),
        ),
      ],
    );
  }
}
