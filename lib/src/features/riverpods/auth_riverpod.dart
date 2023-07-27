import 'package:change30/src/features/firebase/firestore_service.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../firebase/firebase_auth.dart';

class AuthProvider extends ChangeNotifier {
  final bool _isLoading = false;

  UserCredential? _userCredential;
  final Map<String, dynamic> _userData = {};
  FirebaseAuthClass fauth = FirebaseAuthClass();
  FirestoreService fstore = FirestoreService();

  bool get isLoading => _isLoading;
  UserCredential? get userCredential => _userCredential;
  Map<String, dynamic> get userData => _userData;

  Future<UserCredential> loginUserWithFirebase(
      String email, String password) async {
    //setLoader(true);
    try {
      final _userCredential =
          await fauth.loginUserWithFirebase(email, password);
      //setLoader(false);
      return _userCredential;
    } catch (e) {
      //setLoader(false);
      return Future.error(e);
    }
  }

  Future<UserCredential> signUpUserWithFirebase(
      String email, String password, String name) async {
    //setLoader(true);
    _userCredential = await fauth.signUpWithFirebase(email, password, name);
    final data = {
      'email': email,
      'password': password,
      'uid': _userCredential!.user!.uid,
      'datetime': DateTime.now().toString(),
      'name': name
    };
    String uid = _userCredential!.user!.uid;
    await addUserToDatabase(data, 'users', uid);

    return _userCredential!; //TODO: burda bi sıkıntı var ona bakıcaz
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
