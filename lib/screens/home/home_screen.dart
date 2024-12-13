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
        child: ListView(
          shrinkWrap: true,
          children: [
            Stack(
              clipBehavior: Clip.none,
              children: [
                Positioned(
                  child: Container(
                      height: 200, color: Theme.of(context).primaryColor),
                ),
                Positioned(
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
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
                ),
                Positioned(
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height,
                  top: 100,
                  child: const Padding(
                    padding: EdgeInsets.all(24),
                    child: EWallet(),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 64),
            Padding(
              padding: const EdgeInsets.all(16),
              child: Container(
                padding: EdgeInsets.all(8),
                decoration: BoxDecoration(
                  border: Border.all(
                    color: Colors.grey[300]!,
                    width: 1,
                  ),
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
            ),
            Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
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
            ),
          ],
        ),
      ),
    );
  }
}
