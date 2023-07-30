import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../firebase/firestore_service.dart';

class WriteData extends ChangeNotifier {
  UserCredential? _userCredential;
  final Map<String, dynamic> _userData = {};

  FirestoreService fstore = FirestoreService();
  UserCredential? get userCredential => _userCredential;
  Map<String, dynamic> get userData => _userData;
}
