import 'package:calendar_view/calendar_view.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:wesbeng/screens/splash_screen.dart';

DateTime get _now => DateTime.now();

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Wesbeng',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: const Color.fromRGBO(160, 214, 131, 1),
        visualDensity: VisualDensity.adaptivePlatformDensity,
        fontFamily: GoogleFonts.openSans().fontFamily,
      ),
      home: const SplashScreen(),
    );
  }
}
