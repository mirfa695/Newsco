import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:newsco/utilities/network_failures.dart';
import '../model_class/class_article.dart';

class ApiServices {
  Future getdata() async {
    final response = await http.get(Uri.parse(
        'https://newsapi.org/v2/everything?q=bitcoin&apiKey=3e31c8fd915d47ce97f187b1657495ac'));
    if (response.statusCode == 200) {
      var data = jsonDecode(response.body);
      return data;
    } else {
      throw NetworkFailures.errorHandling(response.statusCode);
    }
  }

  Future fetchData1() async {
    final response = await http.get(Uri.parse(
        'https://newsapi.org/v2/top-headlines?country=us&apiKey=3e31c8fd915d47ce97f187b1657495ac'));
    if (response.statusCode == 200) {
      var data = jsonDecode(response.body);
      List<Article> article = data["articles"].map<Article>((e) {
        return Article.fromJson(e);
      }).toList();
      return article;
    } else {
      throw (NetworkFailures.errorHandling(response.statusCode));
    }
  }
}
