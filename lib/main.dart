import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:wesbeng/providers/cash_out_provider.dart';
import 'package:wesbeng/providers/education_content_provider.dart';
import 'package:wesbeng/providers/transaction_provider.dart';
import 'package:wesbeng/providers/user_provider.dart';
import 'package:wesbeng/screens/auth/login_screen.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => UserProvider()),
        ChangeNotifierProvider(create: (_) => EducationContentProvider()),
        ChangeNotifierProvider(create: (_) => TransactionProvider()),
        ChangeNotifierProvider(create: (_) => CashOutProvider()),
      ],
      child: MaterialApp(
        title: 'Wesbeng',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primaryColor: const Color.fromRGBO(160, 214, 131, 1),
          visualDensity: VisualDensity.adaptivePlatformDensity,
          fontFamily: 'Inter',
        ),
        home: const LoginScreen(),
      ),
    );
  }
}
