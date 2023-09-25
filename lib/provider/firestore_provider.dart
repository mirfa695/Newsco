import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/widgets.dart';

import '../model_class/class_user.dart';

class FirestoreProvider extends ChangeNotifier{
  final FirebaseFirestore _firestoreService=FirebaseFirestore.instance;
 var authUser= FirebaseAuth.instance.currentUser;
  Future registerDatabase(
      User1 user
      )async{
    await _firestoreService.collection('UserDetails').doc(authUser!.uid).set(user.toJson());
    notifyListeners();
  }
  Future<DocumentSnapshot<Map<String, dynamic>>>getData() async {
    try {
      DocumentSnapshot<Map<String,dynamic>>snapshot= await _firestoreService.collection('UserDetails').doc(authUser!.uid).get();
      if (snapshot.exists) {
        print(snapshot.data());
        return snapshot;
      } else {
        print("Document does not exist.");
        throw 'Error';
      }
    } catch (e) {
      rethrow;
    }
  }
}