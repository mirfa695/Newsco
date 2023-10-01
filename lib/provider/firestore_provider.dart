import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:newsco/services/firestore_service.dart';

class FirestoreProvider extends ChangeNotifier {
  Future getUser(BuildContext context) async {
    try {
      await FirestoreServices().getData();
      notifyListeners();
    } catch (e) {
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text(e.toString())));
    }
  }

  Future CartDetails(String image, String title, String date, String content,
      String author) async {
    FirestoreServices().Cart(image, title, date, content, author);
    notifyListeners();
  }
}
