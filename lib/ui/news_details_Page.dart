import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:news_for_you/controller/news_details_page_controller.dart';

import '../theme/app_color.dart';
import '../utils/assets_png.dart';

class NewsDetailPage extends GetView<NewsDetailsPageController> {

  const NewsDetailPage({super.key,});

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;
    double imageHeight = screenHeight * 0.35;

    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Stack(
            children: [
              ClipRRect(
                borderRadius: const BorderRadius.only(
                  bottomLeft: Radius.circular(16),
                  bottomRight: Radius.circular(16),
                ),
                child: CachedNetworkImage(
                  height: imageHeight,
                  width: double.infinity,
                  imageUrl: controller.article.urlToImage ?? '',
                  cacheKey: controller.article.urlToImage ?? '',
                  errorWidget: (context, url, error) =>
                      Image.asset(AssetsAnnotationPNG().defaultImage,
                        fit: BoxFit.cover, ),
                  placeholder: (context, url) =>
                      Image.asset(AssetsAnnotationPNG().defaultImage,
                        fit: BoxFit.cover,  ),
                  fit: BoxFit.cover,
                ),
              ),
              // Back button with navigation and keyboard dismissal
              GestureDetector(
                onTap: () {
                  Navigator.pop(context);
                  FocusScope.of(context).unfocus();
                },
                child: Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: screenWidth * 0.05,
                    vertical: screenHeight * 0.05,
                  ),
                  child: const Icon(Icons.arrow_back, color:AppColors.white),
                ),
              ),
              // Bookmark icon
              Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: screenWidth * 0.05,
                  vertical: screenHeight * 0.05,
                ),
                child: const Align(
                  alignment: Alignment.topRight,
                  child: Icon(Icons.bookmark, color: AppColors.white),
                ),
              ),
            ],
          ),
          // Scrollable article content
          Expanded(
            child: SingleChildScrollView(
              child: Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: screenWidth * 0.05,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: screenHeight * 0.03),
                    // Article title with accent bar
                    Row(
                      children: [
                        Container(
                          width: screenWidth * 0.01,
                          color: AppColors.accent,
                          height: screenHeight * 0.075,
                        ),
                        SizedBox(width: screenWidth * 0.02),
                        Expanded(
                          child: Text(
                            controller.article.title,
                            maxLines: 2,
                            style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                              fontWeight: FontWeight.w700,
                              height: 1.1,
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: screenHeight * 0.04),
                    // Article description
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.04),
                      child: Text(
                        '${controller.article.description?.replaceAll('\n', ' ')}'
                            '${controller.article.description?.replaceAll('\n', ' ')}',
                        style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                          fontWeight: FontWeight.w400,
                          height: 1.5,
                        ),
                      ),
                    ),
                    SizedBox(height: screenHeight * 0.03),
                    // Publication date
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.04),
                      child: Text(
                        DateFormat("d MMM y").format(controller.article.publishedAt),
                        style: Theme.of(context).textTheme.bodySmall?.copyWith(
                          fontWeight: FontWeight.w600,
                          color: AppColors.black54,
                          fontSize: 12,
                        ),
                      ),
                    ),
                    const SizedBox(height: 50,)
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}