import '../env/news_api_key.dart';

class Constants {
  var currDt = DateTime.now().day;
  String newsUri(int? newsPerPage, int? page) {
    return 'https://newsapi.org/v2/everything?q=tesla&from=2024-04-$currDt&sortBy=publishedAt&pageSize=$newsPerPage&page=$page&apiKey=${NewsKeys.newsApiKey}';
  }
}
