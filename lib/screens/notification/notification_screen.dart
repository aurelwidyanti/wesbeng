import 'package:flutter/material.dart';
import 'package:wesbeng/constants/notifications.dart';

class NotificationScreen extends StatefulWidget {
  const NotificationScreen({super.key});

  @override
  State<NotificationScreen> createState() => _NotificationScreenState();
}

class _NotificationScreenState extends State<NotificationScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: const Text(
          'Notification',
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.only(left: 16, right: 16, top: 16),
        child: ListView.builder(
          itemCount: notifications.length,
          itemBuilder: (context, index) {
            return Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
                side: BorderSide(
                  color: Colors.grey[300]!,
                  width: 1,
                ),
              ),
              color: Colors.white,
              child: ListTile(
                leading: ClipOval(
                  child: Container(
                    padding: const EdgeInsets.all(8),
                    color: Colors.white,
                    child: Icon(
                      Icons.notifications,
                      color: Theme.of(context).primaryColor,
                    ),
                  ),
                ),
                title: Text(notifications[index]['title']),
                subtitle: Text(notifications[index]['description']),
              ),
            );
          },
        ),
      ),
    );
  }
}
