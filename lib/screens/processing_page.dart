import 'dart:async';

import 'package:flutter/material.dart';

class ProcessingAttributesPage extends StatefulWidget {
  const ProcessingAttributesPage({super.key});

  @override
  State<ProcessingAttributesPage> createState() =>
      _ProcessingAttributesPageState();
}

class _ProcessingAttributesPageState extends State<ProcessingAttributesPage> {
  double progressValue = 0.0;

  @override
  void initState() {
    increaseProgress();
    super.initState();
  }

  void increaseProgress() {
    var oneSec = const Duration(seconds: 1);

    Timer.periodic(oneSec, (timer) {
      setState(() {
        progressValue += 0.1;

        if (progressValue.toStringAsFixed(1) == '1.0') {
          timer.cancel();
        }
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Stack(children: [
          SizedBox(
            height: 120,
            width: 120,
            child: CircularProgressIndicator(
              backgroundColor: Colors.black,
              strokeWidth: 8,
              value: progressValue,
              valueColor: const AlwaysStoppedAnimation<Color>(Colors.red),
            ),
          ),
          Positioned(
            top: 50,
            left: 40,
            child: Text(
              "%${(progressValue * 100).round()}",
              style: Theme.of(context).textTheme.headlineSmall,
            ),
          )
        ]),
      ),
    );
  }
}
