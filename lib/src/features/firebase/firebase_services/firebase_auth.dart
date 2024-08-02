import 'dart:async';
import 'package:change30/src/features/firebase/abstracts/base_firebase_service.dart';
import 'package:change30/src/features/firebase/firebase_services/firestore_service.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

class FirebaseAuthClass extends BaseFirebaseService {
  FirebaseAuth firestoreAuth = FirebaseAuth.instance;
  FirestoreService firestoreService = FirestoreService();
  final GoogleSignIn _googleSignIn = GoogleSignIn();

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
      final userCredentials = firestoreAuth.signInWithEmailAndPassword(
          email: email, password: password);

      return userCredentials;
    } on FirebaseAuthException catch (e) {
      throw 'Error logging in: ${e.code}';
    } catch (e) {
      throw e.toString();
    }
  }

  Future<UserCredential> loginWithApple() {
    try {
      final userCredentials = FirebaseAuthClass().loginWithApple();
      return userCredentials;
    } on FirebaseAuthException catch (e) {
      throw e.code;
    } catch (e) {
      throw e.toString();
    }
  }

  Future<User?> signInWithGoogle() async {
    try {
      // Google ile giriş yapmayı başlat
      final GoogleSignInAccount? googleSignInAccount =
          await _googleSignIn.signIn();

      // Google hesabından kimlik doğrulama bilgilerini al
      final GoogleSignInAuthentication? googleSignInAuthentication =
          await googleSignInAccount?.authentication;

      // Firebase kimlik doğrulama sağlayıcısını oluştur
      final AuthCredential credential = GoogleAuthProvider.credential(
        accessToken: googleSignInAuthentication?.accessToken,
        idToken: googleSignInAuthentication?.idToken,
      );

      // Firebase ile oturum aç
      final UserCredential userCredential =
          await firestoreAuth.signInWithCredential(credential);

      // Kullanıcıyı döndür
      return userCredential.user;
    } catch (e) {
      print(e);
      return null;
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
    try {
      final userCredential = await firestoreAuth.createUserWithEmailAndPassword(
          email: email, password: password);
      //ilk kayıtda kişinin adı email ve şifresini firebase aktarıyoruz
      var id = FirebaseAuth.instance.currentUser!.uid.toString();
      firestoreService.addDataToFirestore(data, "users", id);
      return userCredential;
    } on FirebaseAuthException catch (e) {
      throw e.code;
    }
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
