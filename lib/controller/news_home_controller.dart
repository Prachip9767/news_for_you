import 'package:get/get.dart';
import 'package:news_for_you/data/news_article.dart';
import 'package:news_for_you/service_factory/network_service.dart';

class NewsHomeController extends GetxController{

  @override
  void onInit() {
    getData();
    super.onInit();
  }
  RxList<NewsArticle> articles = <NewsArticle>[].obs;
  bool isLoading = true;

  Future<void> getData() async {
    try {
      isLoading = true;
      var newsList = await ServiceFactory.fetchNewsList();
      if (newsList != null) {
        articles.value = newsList;
      }
    } finally {
      isLoading = false;
    }
  }

}