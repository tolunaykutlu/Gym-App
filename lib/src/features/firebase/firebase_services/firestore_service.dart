import 'dart:async';

import 'package:change30/src/features/firebase/abstracts/base_firestore_service.dart';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class FirestoreService extends BaseFirestoreService {
  final _firestoreInstance = FirebaseFirestore.instance;
  @override
  Future addDataToFirestore(
      Map<String, dynamic> data, String collectionName, String docName) async {
    try {
      await _firestoreInstance
          .collection(collectionName)
          .doc(docName)
          .set(data);
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  @override
  Future updateDataToFirestore(
      Map<String, dynamic> data, String collectionName, String docName) async {
    try {
      await _firestoreInstance
          .collection(collectionName)
          .doc(docName)
          .update(data)
          .then((value) => value)
          .catchError((error) => error.toString());
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  @override
  String getUserUuid() {
    String? userId;
    if (FirebaseAuth.instance.currentUser != null) {
      userId = FirebaseAuth.instance.currentUser!.uid;
      return userId;
    } else {
      return "";
    }
  }

  @override
  Future getDataFromFirebase(String collectionName, String docName) async {
    try {
      var userDocument = await FirebaseFirestore.instance
          .collection(collectionName)
          .doc(docName)
          .get();

      if (userDocument.exists) {
        var userData = userDocument;
        return userData;
      } else {
        return '';
      }
    } catch (e) {
      throw Exception(e);
    }
  }

  @override
  Future addUserToLeaderboard(String? username, int score) async {
    {
      await FirebaseFirestore.instance.collection('leaderboard').add({
        'username': username ?? "gizlii kalsin",
        'score': score,
      });
    }
  }
}
