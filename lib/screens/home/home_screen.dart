import 'package:flutter/material.dart';
import 'package:heroicons_flutter/heroicons_flutter.dart';
import 'package:syncfusion_flutter_datepicker/datepicker.dart';
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
  bool _isHidden = true;
  DateRangePickerController _datePickerController = DateRangePickerController();
  DateTime? startDate;
  DateTime? endDate;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(left: 16, right: 16, top: 16),
          child: ListView(
            shrinkWrap: true,
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Greetings(),
                  const Spacer(),
                  IconButton(
                    icon: const Icon(
                      HeroiconsSolid.bellAlert,
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
              const Padding(
                padding: EdgeInsets.symmetric(vertical: 16),
                child: Text(
                  'Hope you have a great day ahead!',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
              EWallet(),
              const SizedBox(height: 24),
              Container(
                padding: EdgeInsets.all(8),
                decoration: BoxDecoration(
                  border: Border.all(
                    color: Colors.grey[300]!,
                    width: 1,
                  ),
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: SfDateRangePicker(
                  headerHeight: 60,
                  headerStyle: const DateRangePickerHeaderStyle(
                    backgroundColor: Colors.white,
                    textAlign: TextAlign.center,
                    textStyle: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  todayHighlightColor: Theme.of(context).primaryColor,
                  selectionColor: Theme.of(context).primaryColor,
                  backgroundColor: Colors.white,
                  controller: _datePickerController,
                ),
              ),
              const SizedBox(height: 16),
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
        ),
      ),
    );
  }
}
