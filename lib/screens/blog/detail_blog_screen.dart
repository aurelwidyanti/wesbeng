import 'package:flutter/material.dart';

class DetailBlogScreen extends StatelessWidget {
  const DetailBlogScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        actions: [
          Container(
            margin: const EdgeInsets.only(right: 16),
            child: IconButton(
              icon: const Icon(Icons.share),
              onPressed: () {
                // Share functionality
              },
            ),
          ),
        ],
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(12),
                child: Image.network(
                  'https://via.placeholder.com/400x200',
                  height: 200,
                  width: double.infinity,
                  fit: BoxFit.cover,
                ),
              ),
              const SizedBox(height: 16),
              Text(
                'October 4, 2021',
                style: TextStyle(
                  color: Colors.grey[600],
                  fontSize: 14,
                ),
              ),
              const SizedBox(height: 8),
              const Text(
                'How to get started as a mobile app designer and get your first client?',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 16),
              const Expanded(
                child: SingleChildScrollView(
                  child: Text(
                    'Everyone wants to make the next great mobile app. It can be an extremely profitable way to make some money if you know what you\'re doing.\n\n'
                    'If you\'ve got a great mobile app idea and decided to consult with a developer or an app development company, you may have been surprised to hear how costly it is to outsource development.\n\n'
                    'So that\'s when the thought hit you, "I can just do learn to do this myself!"',
                    style: TextStyle(fontSize: 16, height: 1.5),
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
