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

  final List<UserModel> _userData = [];

  void addUserData(UserModel usermodel) {
    _userData.add(usermodel);
    notifyListeners();
  }
}
