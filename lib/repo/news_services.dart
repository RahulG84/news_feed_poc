import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:news_feed_poc/model/news_data_model.dart';
import 'package:news_feed_poc/utils/constants.dart';

class ApiService {
  static Future<List<Articles>> fetchNewsData({
    required http.Client client,
    int? newsPerPage,
    int? page,
    String? field,
  }) async {
    Constants constants = Constants();

    final response = await client.get(
      Uri.parse(
        constants.newsUri(newsPerPage, page, field),
      ),
    );

    if (response.statusCode == 200) {
      final Map<String, dynamic> responseData = jsonDecode(response.body);
      final List<dynamic> articles = responseData['articles'];
      List<Articles> newsList =
          articles.map((article) => Articles.fromJson(article)).toList();
      return newsList;
    } else if (response.statusCode == 404) {
      throw Exception('Data Not Found');
    } else if (response.body.contains('rateLimited')) {
      final Map<String, dynamic> res = jsonDecode(response.body);
      String errorMessage = res['message'];
      throw Exception(errorMessage);
    } else {
      throw Exception('Failed to load news data');
    }
  }
}
