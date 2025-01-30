import 'package:get/get.dart';
import 'package:news_for_you/bindings/news_binding.dart';
import 'package:news_for_you/bindings/news_detail_page_binding.dart';
import 'package:news_for_you/ui/news_details_Page.dart';
import 'package:news_for_you/ui/news_home.dart';

class NewsPages{
  NewsPages._();

  static const initial =ProductRoutesPaths.newsHome ;

  static final routes = <GetPage>[
    GetPage(
        name: ProductRoutesPaths.newsHome,
        page: () => const NewsHome(),
        binding:NewsBinding()
    ),
    GetPage(
        name: ProductRoutesPaths.newsDetailPage,
        page: () => const NewsDetailPage(),
        binding:NewsDetailPageBinding()
    ),
  ];
}


abstract class ProductRoutesPaths {
  static const newsHome='/';
  static const newsDetailPage='/newsDetailPage';

}