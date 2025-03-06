import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:n_gold/app/utils/app_assets.dart';
import 'package:n_gold/app/widgets/custom_loading.dart';
import '../controllers/news_controller.dart';
import '../widgets/news/news_item_card.dart';

class NewsScreen extends StatelessWidget {
  final NewsController _newsController = Get.find<NewsController>();

  NewsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Obx(() {
        if (_newsController.isLoading.value) {
          return CustomLoading(icon: knewsloading);
        }

        if (_newsController.errorMessage.isNotEmpty) {
          return Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Error: ${_newsController.errorMessage.value}',
                  style: TextStyle(color: Colors.red),
                ),
                SizedBox(height: 16),
                ElevatedButton(
                  onPressed: () => _newsController.refreshNews(),
                  child: Text('Retry'),
                ),
              ],
            ),
          );
        }

        if (_newsController.newsList.isEmpty) {
          return Center(
            child: Text('No news available'),
          );
        }

        return RefreshIndicator(
          onRefresh: () async => _newsController.refreshNews(),
          child: ListView.builder(
            itemCount: _newsController.newsList.length,
            itemBuilder: (context, index) {
              final news = _newsController.newsList[index];
              return NewsItemCard(news: news);
            },
          ),
        );
      }),
    );
  }
}
