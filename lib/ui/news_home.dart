import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:news_for_you/controller/news_home_controller.dart';

class NewsHome extends GetView<NewsHomeController>{
  const NewsHome({super.key});


  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      itemCount: controller.articles.length,
        itemBuilder: (context, index) {
          return Text(controller.articles[index].title);

        }, separatorBuilder: (BuildContext context, int index) {
        return const Divider(height: 2,);
    },);
  }

}