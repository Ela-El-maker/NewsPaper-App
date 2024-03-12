import 'package:get/get.dart';
import 'package:ztm/models/newsModels.dart';
import 'package:ztm/services/remoteService.dart';

class NewsController extends GetxController {
  var newsArticle = <NewsArticle>[].obs;
  var isLoading = true.obs;

  @override
  void onInit() {
    // fetch article function goes here
    fetchArticles();
    super.onInit();
  }

  void fetchArticles() async {
    try {
      isLoading(true);
      var articles = await RemoteNewService.fetchNewsArticle();
      if (articles != null) {
        newsArticle(articles);
        isLoading(false);
      }
    } finally {
      isLoading.value = false;
      //newsArticle.value = articles;
    }
  }
}
