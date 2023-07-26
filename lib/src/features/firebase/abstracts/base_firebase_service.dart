import 'package:firebase_auth/firebase_auth.dart';

abstract class BaseFirebaseService {
  Future<UserCredential> loginUserWithFirebase(String email, String password);
  Future<UserCredential> signUpWithFirebase(
      String email, String password, String name);

  void signOutuser();
  bool isUserLoggedIn();
}
