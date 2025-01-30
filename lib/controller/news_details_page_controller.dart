import 'package:get/get.dart';
import 'package:news_for_you/data/news_article.dart';

class NewsDetailsPageController extends GetxController{
  late NewsArticle article;
  @override
  void onInit() {
      super.onInit();
      if (Get.arguments != null && Get.arguments is NewsArticle) {
        article = Get.arguments;
      } else {
        throw Exception("Invalid arguments passed to NewsDetailPage");
      }
    super.onInit();
  }
}