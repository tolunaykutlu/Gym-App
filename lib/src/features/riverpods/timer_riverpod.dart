import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class TimerCounter extends ChangeNotifier {
  int counter = 0;
  int totalScore = 0;
  String time = "";

  //350 saniye bunu dakika ve saniye olarak yazdıracağız
  String toplamScore() {
    int dakika = totalScore ~/
        60; // ~/ bu operatör bölünen sayılardan kalan tam sayıyı verir.
    int kalanSaniye = totalScore % 60;
    time = "$dakika dk $kalanSaniye sn";
    return time;
  }

  void addToCounter() {
    counter++;
    totalScore++;
    notifyListeners();
  }
}

final counterProvider = Provider<TimerCounter>((ref) {
  return TimerCounter();
});
