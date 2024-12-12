import 'package:flutter/material.dart';
import 'package:heroicons_flutter/heroicons_flutter.dart';
import 'package:wesbeng/screens/home/home_screen.dart';
import 'package:wesbeng/screens/blog/blog_screen.dart';
import 'package:wesbeng/screens/location/location_screen.dart';
import 'package:wesbeng/screens/profile/profile_screen.dart';

class Entrypoint extends StatefulWidget {
  const Entrypoint({super.key});

  @override
  State<Entrypoint> createState() => _EntrypointState();
}

class _EntrypointState extends State<Entrypoint> {
  List screens = [
    const HomeScreen(),
    const BlogScreen(),
    LocationScreen(),
    const ProfileScreen(),
  ];

  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: screens[selectedIndex],
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
                  HeroiconsSolid.map,
                ),
                label: 'Location',
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
