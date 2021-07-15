import 'package:flutter/foundation.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AuthService with ChangeNotifier {
  Future<void> login(String email, String password) async {
    final FirebaseAuth auth = FirebaseAuth.instance;

    try {
      await auth.signInWithEmailAndPassword(email: email, password: password);
    } catch (error) {
      throw error;
    }
  }

  Future<String> signUp({
    String email,
    String password,
  }) async {
    final FirebaseAuth auth = FirebaseAuth.instance;

    try {
      UserCredential responseData = await auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      return responseData.user.uid;
    } catch (error) {
      throw error;
    }
  }
}
