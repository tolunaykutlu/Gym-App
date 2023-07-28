import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

abstract class BaseFirebaseService {
  Future<UserCredential> loginUserWithFirebase(String email, String password);
  Future<UserCredential> signUpWithFirebase(
      String email, String password, String name);

  void signOutuser(BuildContext context);
  bool isUserLoggedIn();
  bool isUserActive();
}
