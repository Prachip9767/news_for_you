import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:news_for_you/controller/news_home_controller.dart';
import 'package:news_for_you/reusable_widgets/news_item_widget.dart';
import 'package:news_for_you/routes_and_pages/route_and_page.dart';
import 'package:news_for_you/ui/news_details_Page.dart';

class NewsHome extends GetView<NewsHomeController>{
  const NewsHome({super.key});


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(centerTitle: true,
      title: const Text('News For You'),),
      body: SingleChildScrollView(
        child: Obx(()=>
           Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: Column(
              children: [
                Row(
                  children: [
                    const Expanded(
                      child: TextField(
                        decoration: InputDecoration(
                          border: OutlineInputBorder(borderRadius:
                          BorderRadius.all( Radius.circular(20)))
                        ),
                      ),
                    ),
                    IconButton(onPressed: (){

                    }, icon: const Icon(Icons.search))
                  ],
                ),
                ListView.builder(
                  physics: const NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: controller.articles.length,
                    itemBuilder: (context, index) {
                      return NewsItemWidget(article: controller.articles[index],
                          onTap: (){
                          Get.toNamed(ProductRoutesPaths.newsDetailPage,
                              arguments: controller.articles[index]);
                          });

                    },),
              ],
            ),
          ),
        ),
      ),
    );
  }

}