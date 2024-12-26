import 'package:flutter/material.dart';

class DetailBlogScreen extends StatelessWidget {
  final String title;
  final String description;
  final String date;
  final String image;
  final String category;

  const DetailBlogScreen({
    Key? key,
    required this.title,
    required this.description,
    required this.date,
    required this.image,
    required this.category,
  }) : super(key: key);

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
              Container(
                height: 160,
                decoration: BoxDecoration(
                  color: Colors.grey[300],
                ),
                child: Image.network(
                  image,
                  fit: BoxFit.cover,
                  errorBuilder: (context, error, stackTrace) => const Center(
                    child: Icon(
                      Icons.error,
                      color: Colors.red,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 16),
              Text(
                date,
                style: TextStyle(
                  color: Colors.grey[600],
                  fontSize: 14,
                ),
              ),
              const SizedBox(height: 8),
              Text(
                title,
                style: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 16),
              Expanded(
                child: SingleChildScrollView(
                  child: Text(
                    description,
                    style: const TextStyle(fontSize: 16, height: 1.5),
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
