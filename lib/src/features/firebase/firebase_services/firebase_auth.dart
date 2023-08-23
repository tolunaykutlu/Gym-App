import 'dart:async';

import 'package:change30/src/features/firebase/abstracts/base_firebase_service.dart';
import 'package:change30/src/features/firebase/firebase_exceptions.dart';
import 'package:change30/src/features/firebase/firebase_services/firestore_service.dart';
import 'package:firebase_auth/firebase_auth.dart';

class FirebaseAuthClass extends BaseFirebaseService {
  FirebaseAuth firestoreAuth = FirebaseAuth.instance;
  FirestoreService firestoreService = FirestoreService();

  @override
  bool isUserLoggedIn() {
    if (firestoreAuth.currentUser != null) {
      return true;
    } else {
      return false;
    }
  }

// signIn method with email and pw
  @override
  Future<UserCredential> loginUserWithFirebase(String email, String password) {
    try {
      final userCredentials =
          firestoreAuth.signInWithEmailAndPassword(email: email, password: password);
      return userCredentials;
    } on FirebaseAuthException catch (e) {
      throw CustomAuthException(e.code, e.message!);
    } catch (e) {
      throw CustomException(errorMessage: "Unknown Error");
    }
  }

  //Sign out method
  @override
  void signOutuser() {
    firestoreAuth.signOut();
  }

// signup method with email and pw
  @override
  Future<UserCredential> signUpWithFirebase(
      String email, String password, String name) async {
    final data = {'name': name, 'e-mail': email, 'password': password};
    final userCredential = await firestoreAuth.createUserWithEmailAndPassword(
        email: email, password: password);
    //ilk kayıtda kişinin adı email ve şifresini firebase aktarıyoruz
    var id = FirebaseAuth.instance.currentUser!.uid.toString();
    firestoreService.addDataToFirestore(data, "users", id);

    return userCredential;
  }

// user içerdemi diye kontrol
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
