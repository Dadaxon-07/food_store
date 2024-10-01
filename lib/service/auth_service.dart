
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:food_store/pages/login.dart';

class AuthService {
  static final _auth = FirebaseAuth.instance;

  static Future<User?> signInUser(String email, String password) async {
    await _auth.signInWithEmailAndPassword(email: email, password: password);
    final User? firebaseUser = _auth.currentUser;
    return firebaseUser;
  }

  static Future<User?> signUpUser(
      String email, String password, String name) async {
    var authResult = await _auth.createUserWithEmailAndPassword(
        email: email, password: password);
    User? user = authResult.user;
    return user;
  }

  static void signOut(BuildContext context) {
    _auth.signOut();
    Navigator.pushReplacement(context, MaterialPageRoute(builder: (_) {
      return Login();
    }));
  }
}
