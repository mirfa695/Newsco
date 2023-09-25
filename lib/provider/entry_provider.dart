import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:shared_preferences/shared_preferences.dart';



class EntryProvider extends ChangeNotifier {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  SharedPreferences? preferences;
  bool auth=false;
  bool isLoading=false;
  Future<void> registerUserWithEmail(
      String email, String password,BuildContext ctx) async {
    try {
      isLoading=true;
      await _auth
          .createUserWithEmailAndPassword(email: email, password: password);
      isLoading=false;
      notifyListeners();
    }on FirebaseAuthException catch (error) {
      isLoading=false;
      ScaffoldMessenger.of(ctx).showSnackBar(SnackBar(content: Text(error.message.toString())));
    }
  }

    Future<UserCredential> signInWithEmail(String email, String password)async{

      try {
        UserCredential userCredential = await _auth.signInWithEmailAndPassword(
            email: email, password: password);
        notifyListeners();
        return userCredential;
      } catch (e) {
        notifyListeners();
        throw 'Login Failed';
      }}
  Future<void> setBool(bool choice)async {
    preferences=await SharedPreferences.getInstance();
    await preferences?.setBool('isLoggedIn', choice);
  }
  Future signOut()async{
    await _auth.signOut();
    notifyListeners();
  }
}

