import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:news_for_you/data/news_article.dart';
import 'package:news_for_you/theme/app_color.dart';
import 'package:news_for_you/utils/assets_png.dart';

class NewsItemWidget extends StatelessWidget {
  final NewsArticle article;
  final VoidCallback onTap;

  const NewsItemWidget({
    super.key,
    required this.article,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double cardHeight = screenHeight * 0.25;
    return Card(
      child: SizedBox(
        height: cardHeight,
        child: Stack(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: CachedNetworkImage(
                imageUrl: article.urlToImage ?? '',
                cacheKey: article.urlToImage ?? '',
                errorWidget: (context, url, error) => Image.asset(
                  AssetsAnnotationPNG().defaultImage,
                  fit: BoxFit.cover,
                ),
                placeholder: (context, url) => Image.asset(
                  AssetsAnnotationPNG().defaultImage,
                  fit: BoxFit.cover,
                ),
                fit: BoxFit.cover,
                // width: double.infinity,
                // height: double.infinity,
              ),
            ),
            Positioned.fill(
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  gradient: LinearGradient(
                    colors: [
                      Colors.black.withOpacity(0.9),
                      Colors.black.withOpacity(0.9),
                      Colors.black.withOpacity(0.9),
                      Colors.black.withOpacity(0.3),
                    ],
                    begin: Alignment.bottomCenter,
                    end: Alignment.center,
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 12.0, horizontal: 12),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text(
                    DateFormat("d MMM y").format(article.publishedAt),
                    style: const TextStyle(
                      color: AppColors.white,
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    article.title,
                    maxLines: 2,
                    style: const TextStyle(
                      color: AppColors.white,
                      fontSize: 18,
                      height: 1.1,
                      fontWeight: FontWeight.w500,
                    ),
                    overflow: TextOverflow.ellipsis,
                  ),
                  const SizedBox(height: 4),
                  if (article.description?.isNotEmpty ?? false)
                    Text(
                      article.description!.replaceAll('\n', ' '),
                      maxLines: 2,
                      style: const TextStyle(
                        color: AppColors.white,
                        height: 1.1,
                        fontSize: 12,
                      ),
                      overflow: TextOverflow.ellipsis,
                    ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
