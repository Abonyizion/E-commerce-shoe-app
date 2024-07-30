import 'package:flutter/material.dart';

class NotificationPage extends StatelessWidget {
  const NotificationPage({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 5,
        iconTheme: const IconThemeData(color: Colors.purple),
        backgroundColor: Colors.grey[300],
        centerTitle: true,
        title: const Text(
          'NOTIFICATIONS', style: TextStyle(
            color: Colors.purple, fontWeight: FontWeight.w900),
        ),
      ),
      backgroundColor: Colors.grey.shade300,
      body: const Center(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 10.0),
          child: Text(
            "No new notifications",
            style: TextStyle(
              color: Colors.purple,
              fontSize: 25,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
      ),
    );
  }
}
