import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:news_for_you/data/news_article.dart';

import '../data/news_model.dart';

class ServiceFactory {
  static Future<List<NewsArticle>> fetchNewsList() async {
    final url = Uri.parse(
        'https://api.currentsapi.services/v1/latest-news?language=en&apiKey=szkv3Y4XDlOXNR_sMN7_avJQIKo6w3Tm7dy-kDcsPzPehoms&page=1&pageSize=20');
    try {
      final response = await http.get(url);

      if (response.statusCode == 200) {
        final Map<String, dynamic> responseBody = json.decode(response.body);

        final newsResponse = NewsResponse.fromJson(responseBody);

        return newsResponse.articles;
      } else {
        throw Exception('Failed to load articles: ${response.statusCode}');
      }
    } catch (e) {
      throw Exception('Error fetching articles: $e');
    }
  }
}
