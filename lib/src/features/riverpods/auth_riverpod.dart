import 'package:change30/src/features/firebase/firebase_services/firestore_service.dart';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../firebase/firebase_services/firebase_auth.dart';

class AuthProvider extends ChangeNotifier {
  UserCredential? _userCredential;
  final Map<String, dynamic> _userData = {};
  FirebaseAuthClass fauth = FirebaseAuthClass();
  FirestoreService fstore = FirestoreService();

  UserCredential? get userCredential => _userCredential;
  Map<String, dynamic> get userData => _userData;

  Future<UserCredential> loginUserWithFirebase(
      String email, String password, BuildContext context) async {
    try {
      final userCredential = await fauth.loginUserWithFirebase(email, password);

      return userCredential;
    } on FirebaseAuthException catch (e) {
      // exceptionlara göre olayları düzenlicez

      String errorName = e.code;
      if (errorName == "user-not-found") {
        return await showDialog(
            context: context,
            builder: (context) {
              return const AlertDialog(
                actions: [],
                content: Text("Kullanıcı adı veya şifre yanlış"),
              );
            });
      }
      if (errorName == "wrong-password") {
        return await showDialog(
            context: context,
            builder: (context) {
              return const AlertDialog(
                actions: [],
                content: Text("Yanlış şifre"),
              );
            });
      } else {
        return Future.error(e);
      }

    }
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
<<<<<<< Updated upstream

    _userCredential = await fauth.signUpWithFirebase(email, password, name);
=======
    //context ekledkk hataları ayıkladık
    //setLoader(true);
=======
>>>>>>> Stashed changes
    try {
      final userCredential =
          await fauth.signUpWithFirebase(email, password, name);
      return userCredential;
    } on FirebaseAuthException catch (e) {
      String errorName = e.code;
      if (errorName == "email-already-in-use") {
<<<<<<< Updated upstream
        return await showDialog(
            context: context,
            builder: (context) {
              return const AlertDialog(
                actions: [],
                content: Text("E-mail kullanımda"),
              );
            });
=======
        displayMessage(context, "e-mail kullanımda");
      } else if (errorName == "weak-password") {
        displayMessage(context, "Şifre en az 6 karakter olmalıdır");
>>>>>>> Stashed changes
      } else {
        // Handle other errors or rethrow
        rethrow;
      }
      // Return null or a specific error object if needed
      return userCredential!;
    }
<<<<<<< Updated upstream


    return _userCredential!;
=======
>>>>>>> Stashed changes
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
