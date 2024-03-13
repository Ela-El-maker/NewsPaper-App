import 'package:ztm/models/newsModels.dart';
import 'package:http/http.dart' as http;

class RemoteNewService {
  static var client = http.Client();

  static Future<List<NewsArticle>?> fetchNewsArticle() async {
    var response = await client.get(Uri.parse(
        "https://newsapi.org/v2/everything?q=tesla&from=2024-02-13&sortBy=publishedAt&apiKey=4181eda4682749a88133fef982b410f5"));
    if (response.statusCode == 200) {
      return newsArticleFromJson(response.body);
    } else {
      return null;
    }
  }
}
