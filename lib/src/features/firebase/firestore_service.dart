import 'dart:async';

import 'package:change30/src/features/firebase/abstracts/base_firestore_service.dart';

import 'package:cloud_firestore/cloud_firestore.dart';

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
  Future getUserUuid(String uUid) async {
    var id = _firestoreInstance.collection(uUid).id;
    return id;
  }
}
