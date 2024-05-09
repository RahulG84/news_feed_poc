import 'package:intl/intl.dart';

import '../env/news_api_key.dart';

class Constants {
  var currDt = DateTime.now().day;
  String newsUri(int? newsPerPage, int? page) {
    return 'https://newsapi.org/v2/everything?q=tesla&from=2024-04-$currDt&sortBy=publishedAt&pageSize=$newsPerPage&page=$page&apiKey=${NewsKeys.newsApiKey}';
  }

  static String defaultImageUrl =
      'https://storage.googleapis.com/support-forums-api/attachment/thread-21250723-8795753597826717832.png';

  static String formatDate(String dateString) {
    DateTime date = DateTime.parse(dateString);
    DateFormat formatter = DateFormat('MMM dd, yyyy');
    return formatter.format(date);
  }
}
