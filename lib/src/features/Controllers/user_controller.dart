import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../models/user_model.dart';

final userProvider = Provider((ref) {
  return UserDataController();
});

class UserDataController extends ChangeNotifier {
  String userName = "";
  String gender = "";
  String email = "";
  String password = "";
  int heightController = 179;
  int ageController = 18;
  int weigthController = 60;
  bool isMale = true;
  String bmiScore = "";
  String userId = "";

  String calculateUserBMI() {
    double result;

    result = weigthController / (pow(2, (heightController / 100)));

    if (result <= 18.4) {
      bmiScore = "Underweight"; //underweight
    }
    if (result >= 18.5 && result <= 24.9) {
      bmiScore = "Normal"; //Normal
    }
    if (result >= 25.0 && result <= 39.9) {
      bmiScore = "Overweight"; //overweight
    }
    if (result >= 40) {
      bmiScore = "Obese"; //obese
    }
    return bmiScore;
  }

  final List<UserModel> _userData = [];

  void addUserData(UserModel usermodel) {
    _userData.add(usermodel);
    notifyListeners();
  }
}
