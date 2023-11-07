import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class TimerCounter extends ChangeNotifier {
  int counter = 0;
  int totalScore = 0;
  void addToCounter() {
    counter++;
    totalScore++;
    notifyListeners();
  }
}

final counterProvider = Provider<TimerCounter>((ref) {
  return TimerCounter();
});
