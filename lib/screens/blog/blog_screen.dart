import 'package:flutter/material.dart';
import 'package:wesbeng/constants/articles.dart';
import 'package:wesbeng/screens/blog/widgets/article_card.dart';
import 'package:wesbeng/widgets/category_chip.dart';

class BlogScreen extends StatefulWidget {
  const BlogScreen({super.key});

  @override
  State<BlogScreen> createState() => _BlogScreenState();
}

class _BlogScreenState extends State<BlogScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(left: 16, right: 16, top: 16),
          child: Column(
            children: [
              TextField(
                decoration: InputDecoration(
                  hintText: 'Search articles',
                  prefixIcon: const Icon(Icons.search),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                    borderSide: const BorderSide(
                      color: Colors.grey,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 8),
              const Align(
                alignment: Alignment.centerLeft,
                child: Wrap(
                  spacing: 8,
                  children: [
                    CategoryChip(label: 'Organik'),
                    CategoryChip(label: 'Anorganik'),
                    CategoryChip(label: 'B3'),
                  ],
                ),
              ),
              const SizedBox(height: 8),
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        "Recent Articles",
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SingleChildScrollView(
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
                      ),
                      const SizedBox(height: 8),
                      const Text(
                        "Recent Articles",
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 8),
                      SingleChildScrollView(
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
                      ),
                      const SizedBox(height: 8),
                      SingleChildScrollView(
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
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
