import 'package:get/get.dart';
import 'package:ztm/models/newsModels.dart';
import 'package:ztm/services/remoteService.dart';

class NewsController extends GetxController {
  var newsArticle = <NewsArticle>[].obs;
  var isLoading = false.obs;

  @override
  void onInit() {
    // Fetch initial news articles
    fetchArticles();
    super.onInit();
  }

  Future<void> fetchArticles() async {
    try {
      isLoading(true); // Set isLoading to true while fetching
      var articles = await RemoteNewService.fetchNewsArticle();
      if (articles != null) {
        newsArticle.assignAll(articles);
      }
    } finally {
      isLoading(false); // Set isLoading back to false after fetching
    }
  }

  Future<void> refreshArticles() async {
    try {
      isLoading(true); // Set isLoading to true while refreshing
      var articles = await RemoteNewService.fetchNewsArticle();
      if (articles != null) {
        newsArticle.assignAll(articles);
      }
    } finally {
      isLoading(false); // Set isLoading back to false after refreshing
    }
  }
}
