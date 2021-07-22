import 'package:flutter/foundation.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AuthService with ChangeNotifier {
  static FirebaseAuth _auth = FirebaseAuth.instance;

  Future<void> login(String email, String password) async {
    try {
      await _auth.signInWithEmailAndPassword(email: email, password: password);
    } catch (error) {
      throw error;
    }
  }

  Future<void> resetPassword(String email) async {
    try {
      await _auth.sendPasswordResetEmail(email: email);
    } catch (error) {
      throw error;
    }
  }
  
Future<void> logout() async {
    try {
      await _auth.signOut();
    } catch (error) {
      throw error;
    }
  }

  Future<String> signUp({
    String email,
    String password,
  }) async {
    try {
      UserCredential responseData = await _auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      return responseData.user.uid;
    } catch (error) {
      throw error;
    }
  }

  User get currentUser => _auth.currentUser;
}
