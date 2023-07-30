import 'package:change30/src/features/firebase/firestore_service.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../firebase/firebase_auth.dart';

class AuthProvider extends ChangeNotifier {
  UserCredential? _userCredential;
  final Map<String, dynamic> _userData = {};
  FirebaseAuthClass fauth = FirebaseAuthClass();
  FirestoreService fstore = FirestoreService();

  UserCredential? get userCredential => _userCredential;
  Map<String, dynamic> get userData => _userData;

  Future<UserCredential> loginUserWithFirebase(
      String email, String password, BuildContext context) async {
    //setLoader(true);
    try {
      final userCredential = await fauth.loginUserWithFirebase(email, password);
      //setLoader(false);
      return userCredential;
    } on FirebaseAuthException catch (e) {
      //setLoader(false);
      // exceptionlara göre olayları düzenlicez
      if (e.message == "The email address is badly formatted.") {}
      return Future.error(e);
    }
  }

  //current userin ıdsinin olduğu dökümana bi kaç bilgi daha ekle
  /* Future<void> addUserSpec(Map<String, dynamic> data) {
    var userId = fauth.auth.currentUser!.uid;
    return fstore.addDataToFirestore(data, "users", userId);
  } */

  Future<UserCredential> signUpUserWithFirebase(
      String email, String password, String name) async {
    //setLoader(true);
    _userCredential = await fauth.signUpWithFirebase(email, password, name);

    return _userCredential!;
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

  /* setLoader(bool loader) {
    _isLoading = loader;
    notifyListeners();
  } */
}

final authProvider = ChangeNotifierProvider((ref) {
  return AuthProvider();
});
