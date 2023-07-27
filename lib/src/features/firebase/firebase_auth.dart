import 'package:change30/src/features/firebase/abstracts/base_firebase_service.dart';
import 'package:firebase_auth/firebase_auth.dart';

class FirebaseAuthClass extends BaseFirebaseService {
  FirebaseAuth auth = FirebaseAuth.instance;

  @override
  bool isUserLoggedIn() {
    if (auth.currentUser != null) {
      return true;
    } else {
      return false;
    }
  }

  @override
  Future<UserCredential> loginUserWithFirebase(String email, String password) {
    final userCredentials =
        auth.signInWithEmailAndPassword(email: email, password: password);
    return userCredentials;
  }

  @override
  void signOutuser() {
    auth.signOut();
  }

  @override
  Future<UserCredential> signUpWithFirebase(
      String email, String password, String name) async {
    final userCredential = await auth.createUserWithEmailAndPassword(
        email: email, password: password);
    return userCredential;
  }
}
