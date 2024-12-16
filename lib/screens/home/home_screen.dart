import 'package:flutter/material.dart';
import 'package:heroicons_flutter/heroicons_flutter.dart';
import 'package:wesbeng/constants/articles.dart';
import 'package:wesbeng/screens/blog/widgets/article_card.dart';
import 'package:wesbeng/screens/home/widgets/e_wallet.dart';
import 'package:wesbeng/screens/home/widgets/greetings.dart';
import 'package:wesbeng/screens/notification/notification_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: ListView(
            shrinkWrap: true,
            children: [
              Row(
                children: [
                  const Greetings(),
                  const Spacer(),
                  IconButton(
                    icon: const Icon(
                      HeroiconsSolid.bellAlert,
                      color: Colors.black,
                    ),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const NotificationScreen(),
                        ),
                      );
                    },
                  ),
                ],
              ),
              const SizedBox(height: 16),
              const EWallet(),
              const SizedBox(height: 16),
              const SizedBox(height: 16),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Trending Articles',
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
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
