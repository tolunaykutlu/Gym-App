import 'package:change30/src/features/models/exercise_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ExerciseController extends ChangeNotifier {
  List<Exercises> exerciseList = [
    Exercises(name: "Pushup"),
    Exercises(name: "Jumping Jacks"),
    Exercises(name: "Squat"),
    Exercises(name: "Lunge"),
    Exercises(name: "V sit"),
    Exercises(name: "Sit Up"),
  ];
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
