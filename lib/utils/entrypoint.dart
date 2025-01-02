import 'package:flutter/material.dart';
import 'package:heroicons_flutter/heroicons_flutter.dart';
import 'package:provider/provider.dart';
import 'package:wesbeng/providers/education_content_provider.dart';
import 'package:wesbeng/providers/transaction_provider.dart';
import 'package:wesbeng/providers/user_provider.dart';
import 'package:wesbeng/screens/home/home_screen.dart';
import 'package:wesbeng/screens/blog/blog_screen.dart';
import 'package:wesbeng/screens/profile/profile_screen.dart';

class Entrypoint extends StatefulWidget {
  const Entrypoint({super.key});

  @override
  State<Entrypoint> createState() => _EntrypointState();
}

class _EntrypointState extends State<Entrypoint> {
  int selectedIndex = 0;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _refreshData();
    });
  }

  Future<void> _refreshData() async {
    await Provider.of<UserProvider>(context, listen: false)
        .fetchUserData(context);
    await Provider.of<EducationContentProvider>(context, listen: false)
        .fetchEducationContent();

    if (mounted) {
      await Provider.of<TransactionProvider>(context, listen: false)
          .fetchTransactions();
    }
  }

  List screens = [
    const HomeScreen(),
    const BlogScreen(),
    const ProfileScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: RefreshIndicator(
        onRefresh: _refreshData,
        child: screens[selectedIndex],
      ),
      bottomNavigationBar: SizedBox(
        height: 80,
        child: BottomNavigationBar(
            backgroundColor: Colors.white,
            selectedItemColor: Theme.of(context).primaryColor,
            unselectedItemColor: Colors.grey,
            onTap: (value) {
              setState(() {
                selectedIndex = value;
              });
            },
            currentIndex: selectedIndex,
            items: const [
              BottomNavigationBarItem(
                icon: Icon(
                  HeroiconsSolid.home,
                ),
                label: 'Home',
              ),
              BottomNavigationBarItem(
                icon: Icon(
                  HeroiconsSolid.globeAlt,
                ),
                label: 'Blog',
              ),
              BottomNavigationBarItem(
                icon: Icon(
                  HeroiconsSolid.userCircle,
                ),
                label: 'Profile',
              ),
            ]),
      ),
    );
  }
}
