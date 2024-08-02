// ignore_for_file: use_build_context_synchronously

import 'package:change30/src/features/firebase/firebase_services/firestore_service.dart';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../core/components/helpers/auth_error_dialog.dart';
import '../firebase/firebase_services/firebase_auth.dart';

class AuthProvider extends ChangeNotifier {
  UserCredential? _userCredential;
  final Map<String, dynamic> _userData = {};
  FirebaseAuthClass fauth = FirebaseAuthClass();
  FirestoreService fstore = FirestoreService();

  UserCredential? get userCredential => _userCredential;
  Map<String, dynamic> get userData => _userData;

  Future<User?> loginUserWithFirebase(
      String email, String password, BuildContext context) async {
    User? user;
    try {
      final userCredential = await fauth.loginUserWithFirebase(email, password);
      user = userCredential.user;
      // If login is successful, return the userCredential
      if (user!.uid != "") {
        return user;
      }
    } on FirebaseAuthException catch (e) {
      // Handle different types of exceptions
      if (e.code == 'user-not-found') {
        displayMessage(context, "There is no user with this email");
      } else if (e.code == "invalid-email") {
        displayMessage(context, "Invalid email format");
      } else if (e.code == "wrong-password") {
        displayMessage(context, "Incorrect password");
      } else {
        // For other errors, return null
        displayMessage(context, "An error occurred. Please try again later.");
        return null;
      }
    }
    return user;
  }

  /* /*  Future<void> addUser(String name, String gender, String age) {
    // Call the user's CollectionReference to add a new user
    CollectionReference collectionRef =
        FirebaseFirestore.instance.collection('egzersiz');

    DateTime date = DateTime.now();
    return collectionRef
        .add({'full_name': name, 'gender': gender, 'age': age, 'date': date})
        .then((value) => value)
        .catchError((error) => error); //print("Failed to add user: $error"));
  } */
 */
  /* String userId() {
    //içerdeki userin id sini almak için
    String id = fstore.getUserUuid();
    return id;
  } */

  Future getData(String collectionName, String docName) async {
    var data = await fstore.getDataFromFirebase(collectionName, docName);
    return data;
  }

  Future<UserCredential> signUpUserWithFirebase(
      String email, String password, String name, BuildContext context) async {
    _userCredential = await fauth.signUpWithFirebase(email, password, name);

    //context ekledkk hataları ayıkladık

    try {
      _userCredential = await fauth.signUpWithFirebase(email, password, name);
    } on FirebaseAuthException catch (e) {
      String errorName = e.code;
      if (errorName == "email-already-in-use") {
        displayMessage(context, "e-mail kullanımda");
      }
      if (errorName == "weak-password") {
        displayMessage(context, "Şifre en az 6 karakter olmalıdır");
        // return toastMessage("Şifre en az 6 karakter olmalı");
      } else {
        return Future.error(e);
      }
    }

    return userCredential!;
  }

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
