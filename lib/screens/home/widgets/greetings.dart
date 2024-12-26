import 'package:flutter/material.dart';

class Greetings extends StatefulWidget {
  const Greetings({super.key});

  @override
  State<Greetings> createState() => _GreetingsState();
}

class _GreetingsState extends State<Greetings> {
  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.all(0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Morning,',
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          Text(
            'Aurel!',
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
        ],
      ),
    );
  }
}
