import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../model_class/class_user.dart';

class FirestoreServices {
  final FirebaseFirestore _firestoreService = FirebaseFirestore.instance;
  var authUser = FirebaseAuth.instance.currentUser;
  Future RegisterUser(User1 user) async {
    await _firestoreService
        .collection('UserDetails')
        .doc(authUser!.uid)
        .set(user.toJson());
  }

  Future<DocumentSnapshot<Map<String, dynamic>>> getData() async {
    DocumentSnapshot<Map<String, dynamic>> snapshot = await _firestoreService
        .collection('UserDetails')
        .doc(authUser!.uid)
        .get();
    if (snapshot.exists) {
      print(snapshot.data());
      return snapshot;
    } else {
      print("Document does not exist.");
      throw 'Error';
    }
  }

  Future Cart(String image, String title, String date, String content,
      String author) async {
    await _firestoreService.collection('cart').doc(authUser!.uid).set({
      "image": image,
      "title": title,
      "date": date,
      "content": content,
      "author": author
    });
  }
}
