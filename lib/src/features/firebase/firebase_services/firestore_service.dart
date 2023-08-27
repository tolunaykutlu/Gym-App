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
  Future getUserDataFromFirestore(String collectionName, String docName) async {
    try {
      await _firestoreInstance.collection(collectionName).doc(docName).get();
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  @override
  String getUserUuid() {
    final String id;
    var firebaseAth = FirebaseAuth.instance.currentUser;

    if (firebaseAth!.uid.isNotEmpty) {
      id = FirebaseAuth.instance.currentUser!.uid;
      return id;
    } else {
      return "";
    }
  }
}
