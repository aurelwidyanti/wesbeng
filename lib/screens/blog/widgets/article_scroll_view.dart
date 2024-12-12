import 'package:flutter/material.dart';
import 'package:wesbeng/constants/articles.dart';
import 'package:wesbeng/screens/blog/widgets/article_card.dart';

class ArticleScrollView extends StatelessWidget {
  const ArticleScrollView({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: articles.map((article) {
          return SizedBox(
            width: 360,
            child: ArticleCard(
              category: article['category'],
              date: article['date'],
              title: article['title'],
              image: article['image'],
              description: article['description'],
            ),
          );
        }).toList(),
      ),
    );
  }
}
