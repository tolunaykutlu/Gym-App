import 'package:change30/src/features/firebase/firebase_services/firestore_service.dart';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../core/components/helpers/toast_msg.dart';
import '../firebase/firebase_services/firebase_auth.dart';

class AuthProvider extends ChangeNotifier {
  UserCredential? _userCredential;
  final Map<String, dynamic> _userData = {};
  FirebaseAuthClass fauth = FirebaseAuthClass();
  FirestoreService fstore = FirestoreService();

  UserCredential? get userCredential => _userCredential;
  Map<String, dynamic> get userData => _userData;

  Future loginUserWithFirebase(
      String email, String password, BuildContext context) async {
    try {
      final userCredential = await fauth.loginUserWithFirebase(email, password);

      return userCredential;
    } on FirebaseAuthException catch (e) {
      // exceptionlara göre olayları düzenlicez
      if (e.code == 'user-not-found') {
        displayMessage(context, "böyle bi kullanıcı yok");
      }
      if (e.code == "invalid-email") {
        displayMessage(context, "email hatalı");
      }
      if (e.code == "wrong-password") {
        displayMessage(context, "Şifre yanlış");
      } else {}
    }
  }

  displayMessage(BuildContext context, String message) {
    return showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            content: Text(message),
          );
        });
  }

  /*  Future<void> addUser(String name, String gender, String age) {
    // Call the user's CollectionReference to add a new user
    CollectionReference collectionRef =
        FirebaseFirestore.instance.collection('egzersiz');

    DateTime date = DateTime.now();
    return collectionRef
        .add({'full_name': name, 'gender': gender, 'age': age, 'date': date})
        .then((value) => value)
        .catchError((error) => error); //print("Failed to add user: $error"));
  } */

  String userId() {
    //içerdeki userin id sini almak için
    String id = fstore.getUserUuid();
    return id;
  }

  Future<UserCredential> signUpUserWithFirebase(
      String email, String password, String name, BuildContext context) async {
    _userCredential = await fauth.signUpWithFirebase(email, password, name);

    //context ekledkk hataları ayıkladık
    //setLoader(true);
    try {
      _userCredential = await fauth.signUpWithFirebase(email, password, name);
    } on FirebaseAuthException catch (e) {
      //TODO: beş hareket olacak başta videolar gösterilecek
      String errorName = e.code;
      if (errorName == "email-already-in-use") {
        return toastMessage("Email kullanımda");
      }
      if (errorName == "weak-password") {
        return toastMessage("Şifre en az 6 karakter olmalı");
      } else {
        return Future.error(e);
      }
    }

    return _userCredential!;
  }

  //data getirme
  /* Future<UserModel> getUserData(String useruId) async {
    var data = await fstore.getUserDataFromFirestore("users", useruId);
    var userData = UserModel.fromMap(data);
    

    return userData;
  }
 */
  Future<bool> addUserToDatabase(
      Map<String, dynamic> data, String collectionName, String docName) async {
    var value = false;

    fstore.addDataToFirestore(data, collectionName, docName).then((value) {
      value = true;
    }).catchError((e) {
      value = false;
    });
    return value;
  }
}

final authProvider = Provider((ref) {
  return AuthProvider();
});
