import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:news_for_you/data/news_article.dart';

class ServiceFactory {

  static var client = http.Client();

  static Future<List<NewsArticle>> fetchNewsList() async {
    var response = await http.get(Uri.parse(
        'https://run.mocky.io/v3/ed06c213-2c96-40ac-a813-7ff13631fc5a'));

    if (response.statusCode == 200) {
      var jsonData = jsonDecode(response.body);
      if (jsonData['news'] != null) {
        return (jsonData['news'] as List)
            .map((article) => NewsArticle.fromJson(article))
            .toList();
      }
    }
    return [];
  }
}