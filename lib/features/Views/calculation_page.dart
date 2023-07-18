import 'dart:math';

import 'package:change30/core/constants/app_contants.dart';
import 'package:change30/core/extension/size_extension.dart';
import 'package:change30/core/data/get_user_data.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class CalculationPage extends ConsumerWidget {
  const CalculationPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var userDataProvider = ref.watch(userProvider);

    double calculateUserBMI() {
      double result;
      double bmiStatuse = 0;
      result = userDataProvider.weigthController /
          (pow(2, (userDataProvider.heightController / 100)));

      if (result <= 18.4) {
        bmiStatuse = 1; //underweight
      }
      if (result >= 18.5 && result <= 24.9) {
        bmiStatuse = 2; //Normal
      }
      if (result >= 25.0 && result <= 39.9) {
        bmiStatuse = 3; //overweight
      }
      if (result >= 40) {
        bmiStatuse = 4; //obese
      }
      return bmiStatuse;
    }

    return Scaffold(
        appBar: AppBar(),
        body: SizedBox(
          width: context.deviceWidth,
          height: context.deviceHeight,
          child: Column(
            //column a size vermezsen içindeki elemanlardan enfazla yer kaplayanın sizeina kadar x ekseninde genişler
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                userDataProvider.weigthController.toString(),
                style: smallTitleTextStyle(fsize: 30),
              ),
              Text(
                "YOUR BMI SCORE",
                style: smallTitleTextStyle(fsize: 20),
              ),
              if (calculateUserBMI() == 1)
                const BmiResultContainer(
                  color: Colors.yellow,
                  text: "Need to gain some muscle",
                ),
              if (calculateUserBMI() == 2)
                const BmiResultContainer(
                  color: Colors.green,
                  text: "Normal. Keep going. Eat well, exercise",
                ),
              if (calculateUserBMI() == 3)
                const BmiResultContainer(
                  color: Colors.orange,
                  text: "Need to lose some weight",
                ),
              if (calculateUserBMI() == 4)
                const BmiResultContainer(
                  color: Colors.amber,
                  text: "Overweight",
                )
            ],
          ),
        ));
  }
}

class BmiResultContainer extends StatelessWidget {
  final String text;
  final Color color;

  const BmiResultContainer({
    super.key,
    required this.color,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 150,
      width: context.deviceWidth,
      decoration:
          BoxDecoration(borderRadius: BorderRadius.circular(20), color: color),
      child: Center(
          child: Text(
        text,
        style: smallTitleTextStyle(fsize: 20, color: Colors.black),
      )),
    );
  }
}
