import 'dart:async';
import 'package:change30/src/core/constants/app_contants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../features/riverpods/timer_riverpod.dart';

class TimerText extends ConsumerStatefulWidget {
  const TimerText({
    Key? key,
  }) : super(key: key);

  @override
  ConsumerState<TimerText> createState() => _TimerTextState();
}

class _TimerTextState extends ConsumerState<TimerText> {
  Timer? _timer;

  bool isStarted = false;
  int hour = 0;
  int min = 0;
  String start = "START";

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var counter = ref.watch(counterProvider);

    String time = "";
    if (hour == 0 && min < 10 && counter.counter < 10) {
      time = "0$min : 0${counter.counter}";
    } else if (counter.counter > 9) {
      time = "0$min : ${counter.counter}";
    } else {
      time = "$hour : $min : ${counter.counter}";
    }

    timerZero() {
      _timer?.cancel();
      counter.counter = 0;
    }

    startTimer() {
      if (isStarted) {
        _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
          setState(() {
            counter.addToCounter();
            if (counter.counter == 60) {
              counter.counter = 0;
              min++;
            }
            if (min == 60) {
              min = 0;
              hour++;
            }
          });
        });
      } else {
        _timer?.cancel();
      }
    }

    return Column(
      children: [
        InkWell(
          onDoubleTap: () {
            setState(() {
              timerZero();
            });
          },
          onTap: () {
            setState(() {
              isStarted = !isStarted;

              startTimer();
            });
          },
          child: Card(
              shape: StadiumBorder(
                  //yuvarlak
                  side: BorderSide(
                      color: counter.counter % 2 == 0
                          ? AppConstants.primaryColor
                          : AppConstants.secondaryColor,
                      strokeAlign:
                          counter.counter % 2 == 0 ? 0 : 20, //kenarın uzaklığı
                      width: 1)),
              child: SizedBox(
                  width: 150,
                  height: 150,
                  child: Center(
                      child: Text(
                    counter.counter > 0 ? time : start,
                    style: AppConstants.smallTitleTextStyle(
                        color: Colors.black, fsize: 25),
                  )))),
        ),
        AppConstants.spaceMediumH25(),
      ],
    );
  }
}
