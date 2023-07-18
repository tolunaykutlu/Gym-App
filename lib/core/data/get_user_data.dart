import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../features/models/user_model.dart';

final userProvider = Provider((ref) {
  return WriteUserData();
});

class WriteUserData extends ChangeNotifier {
  String userName = "John Doe";
  String gender = "";
  int heightController = 179;
  int ageController = 18;
  int weigthController = 60;
  bool isMale = true;

  List<UserModel> userData = [];

  void addUserData() {
    userData.add(UserModel(
        gender: isMale ? "Male" : "Female",
        name: "MockName",
        age: ageController,
        weight: weigthController,
        height: heightController));
  }
}
