import 'package:flutter/material.dart';

import 'package:flutter_riverpod/flutter_riverpod.dart';

class ExerciseController extends ChangeNotifier {
  final difficultyList = [
    "Beginner Mode",
    "Advanced Mode",
    "Hard Mode",
    "Beast Mode",
    "One Punch Man",
    "David Goggins"
  ];
}

final excerciseProvider = ChangeNotifierProvider((ref) {
  return ExerciseController();
});
