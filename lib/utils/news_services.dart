import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:news_feed_poc/model/news_data_model.dart';

class ApiService {
  static Future<NewsData> fetchNewsData({required http.Client client}) async {
    String uri =
        'https://newsapi.org/v2/everything?q=tesla&from=2024-03-18&sortBy=publishedAt&apiKey=5dd6ce0a24ab425a97d2280c340f2b89';
    final response = await client.get(
      Uri.parse(uri),
    );
    if (response.statusCode == 200) {
      return NewsData.fromJson(jsonDecode(response.body));
    } else if (response.statusCode == 404) {
      throw Exception('Data Not Found');
    } else {
      throw Exception('Failed to load news data');
    }
  }
}
