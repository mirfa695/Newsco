import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:newsco/model_class/class_user.dart';
import 'package:newsco/services/firestore_service.dart';

import 'package:shared_preferences/shared_preferences.dart';

import '../routing/route_name.dart';
class EntryProvider extends ChangeNotifier {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  SharedPreferences? preferences;
  bool auth=false;
  bool isLoading=false;
  Future<void> registerUserWithEmail(User1 user,
      String password,BuildContext ctx) async {
    try {
      isLoading=true;

      await _auth
          .createUserWithEmailAndPassword(email: user.email!, password: password);
      await FirestoreServices().RegisterUser(user);
      Navigator.pushNamed(ctx, RouteName.homeRoute);
      isLoading=false;

      notifyListeners();
    }on FirebaseAuthException catch (error) {
      isLoading=false;
      ScaffoldMessenger.of(ctx).showSnackBar(SnackBar(content: Text(error.message.toString())));
    }
  }

    Future signInWithEmail(String email, String password,BuildContext context)async{
      isLoading=true;
    try {

        var user=await _auth.signInWithEmailAndPassword(
            email: email, password: password);
        isLoading=false;
           Navigator.pushNamed(context, RouteName.homeRoute);
        notifyListeners();
        return user;
      } on FirebaseAuthException catch (e) {
        isLoading=false;
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(e.message.toString())));
      }}
  Future<void> setBool(bool choice)async {
    preferences=await SharedPreferences.getInstance();
    await preferences?.setBool('isLoggedIn', choice);
  }
  Future signOut()async{
    isLoading=true;
    await _auth.signOut();
    isLoading=false;
    notifyListeners();
  }
}

