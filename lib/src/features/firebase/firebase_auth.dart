import 'dart:async';

import 'package:change30/src/features/firebase/abstracts/base_firebase_service.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class FirebaseAuthClass extends BaseFirebaseService {
  FirebaseAuth auth = FirebaseAuth.instance;

  @override
  bool isUserLoggedIn() {
    if (auth.currentUser != null) {
      return true;
    } else {
      return false;
    }
  }

// signIn method with email and pw
  @override
  Future<UserCredential> loginUserWithFirebase(String email, String password) {
    final userCredentials =
        auth.signInWithEmailAndPassword(email: email, password: password);
    return userCredentials;
  }

  //Sign out method
  @override
  void signOutuser(BuildContext context) {
    auth.signOut();
  }

// signup method with email and pw
  @override
  Future<UserCredential> signUpWithFirebase(
      String email, String password, String name) async {
    final userCredential = await auth.createUserWithEmailAndPassword(
        email: email, password: password);
    return userCredential;
  }

//bunu ben user içerdemi diye yazdım ama anlayamadım
  @override
  bool isUserActive() {
    bool isActive = false;

    try {
      FirebaseAuth.instance.authStateChanges().listen((User? user) {
        if (user == null) {
          isActive = false;
        } else {
          isActive = true;
        }
      });
      return isActive;
    } catch (e) {
      throw Exception(e.toString());
    }
  }
}
