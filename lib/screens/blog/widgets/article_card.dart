import 'package:flutter/material.dart';
import 'package:wesbeng/screens/blog/detail_blog_screen.dart';

class ArticleCard extends StatelessWidget {
  final String title;
  final String description;
  final String date;
  final String image;
  final String category;

  const ArticleCard({
    Key? key,
    required this.title,
    required this.description,
    required this.date,
    required this.image,
    required this.category,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        // Navigate to detail blog screen
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => const DetailBlogScreen(),
          ),
        );
      },
      child: SizedBox(
        height: 440,
        child: Card(
          elevation: 0,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
            side: BorderSide(
              color: Colors.grey[300]!,
              width: 1,
            ),
          ),
          color: Colors.white,
          margin: const EdgeInsets.symmetric(vertical: 10),
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 8),
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                  ),
                  padding:
                      const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                  child: Text(
                    category,
                    style: const TextStyle(
                      color: Colors.black,
                    ),
                  ),
                ),
                const SizedBox(height: 8),
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
                const SizedBox(height: 8),
                Text(
                  description,
                  style: const TextStyle(fontSize: 16),
                ),
                const SizedBox(height: 8),
                Text(
                  date,
                  style: const TextStyle(
                    fontStyle: FontStyle.italic,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
