import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:news_feed_poc/model/news_data_model.dart';

class ApiService {
  static Future<List<Articles>> fetchNewsData(
      {required http.Client client, int? newsPerPage}) async {
    var currDt = DateTime.now().day;
    String uri =
        'https://newsapi.org/v2/everything?q=tesla&from=2024-04-$currDt&sortBy=publishedAt&pageSize=$newsPerPage&apiKey=5dd6ce0a24ab425a97d2280c340f2b89';

    final response = await client.get(
      Uri.parse(uri),
    );
    print(response.statusCode);
    if (response.statusCode == 200) {
      final Map<String, dynamic> responseData = jsonDecode(response.body);
      final List<dynamic> articles = responseData['articles'];

      List<Articles> newsList = articles.map((article) => Articles.fromJson(article)).toList();
      print('newsList $newsList');
      return newsList;
      // return NewsData.fromJson(jsonDecode(response.body));
    } else if (response.statusCode == 404) {
      throw Exception('Data Not Found');
    } else {
      throw Exception('Failed to load news data');
    }
  }
}


