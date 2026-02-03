import 'dart:async';

import 'package:change30/src/core/constants/app_contants.dart';
import 'package:flutter/material.dart';

class TimerText extends StatefulWidget {
  const TimerText({super.key});

  @override
  State<TimerText> createState() => _TimerTextState();
}

class _TimerTextState extends State<TimerText> {
  Timer? _timer;
  int _secondsElapsed = 0;
  bool _isRunning = true;

  @override
  void initState() {
    super.initState();
    _startTimer();
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  void _startTimer() {
    _timer?.cancel();
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (!_isRunning) {
        return;
      }
      setState(() {
        _secondsElapsed += 1;
      });
    });
  }

  void _toggleRunning() {
    setState(() {
      _isRunning = !_isRunning;
    });
  }

  void _resetTimer() {
    setState(() {
      _secondsElapsed = 0;
      _isRunning = true;
    });
  }

  String get _formattedTime {
    final minutes = _secondsElapsed ~/ 60;
    final seconds = _secondsElapsed % 60;
    return "${minutes.toString().padLeft(2, '0')}:${seconds.toString().padLeft(2, '0')}";
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: _toggleRunning,
      onDoubleTap: _resetTimer,
      child: Text(
        _formattedTime,
        style: bigtitleTextStyle(AppConstants.primaryColor, fsize: 32),
      ),
    );
  }
}
