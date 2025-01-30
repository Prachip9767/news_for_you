import 'package:get/get.dart';
import 'package:news_for_you/controller/news_details_page_controller.dart';

class NewsDetailPageBinding extends Bindings{
  @override
  void dependencies() {
    Get.lazyPut<NewsDetailsPageController>(() => NewsDetailsPageController());
  }

}