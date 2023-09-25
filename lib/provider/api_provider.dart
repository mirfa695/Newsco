import 'dart:convert';

import 'package:flutter/widgets.dart';

import '../model_class/class_article.dart';
import 'package:http/http.dart' as http;

class ApiProvider extends ChangeNotifier{
  Future<List<Article>> fetchApi()async{

    final response = await http.get(Uri.parse(
        'https://newsapi.org/v2/top-headlines?country=us&apiKey=3e31c8fd915d47ce97f187b1657495ac'));
    var data=jsonDecode(response.body);
    List<Article> article = data["articles"].map<Article>((e){
      return Article.fromJson(e);
    }).toList();
    return article;
  }
}