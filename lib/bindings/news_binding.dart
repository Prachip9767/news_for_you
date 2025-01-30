import 'package:get/get.dart';
import 'package:news_for_you/controller/news_home_controller.dart';

class NewsBinding extends Bindings{
  @override
  void dependencies() {
    Get.lazyPut<NewsHomeController>(() => NewsHomeController());
  }
  
}