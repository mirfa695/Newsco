import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:newsco/services/api_service.dart';

import '../model_class/class_article.dart';
import 'package:http/http.dart' as http;

class ApiProvider extends ChangeNotifier {
  Future fetchApi(BuildContext context) async {
    try {
      var data=await ApiServices().fetchData1();
      notifyListeners();
      return data;
    }
    catch (e) {
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text(e.toString())));
    }
  }

  Future getApi(BuildContext context) async {
    try {
     var data= await ApiServices().getdata();
      notifyListeners();
      return data;
    } catch (e) {
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text(e.toString())));
      notifyListeners();
    }
  }
}
