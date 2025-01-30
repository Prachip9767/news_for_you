import 'package:get/get.dart';
import 'package:news_for_you/bindings/news_binding.dart';
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
  ];
}


abstract class ProductRoutesPaths {
  static const newsHome='/';

}