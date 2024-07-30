import 'package:flutter/material.dart';

class AboutPage extends StatelessWidget {
  const AboutPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      appBar: AppBar(
        elevation: 5,
        iconTheme: const IconThemeData(
          color: Colors.purple,
        ),
        title: const Text('About Us', style: TextStyle(
          fontWeight: FontWeight.bold, fontSize: 25,
            color: Colors.purple,
        ),
        ),
        backgroundColor: Colors.grey[300],
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Card(
              elevation: 5,
              color: Colors.white,
              child: Container(
                height: 100,
                width: 160,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                    color: Colors.white),
                child: const Center(
                  child: Text('CLOUD', style: TextStyle(
                    color: Colors.purple, fontWeight: FontWeight.bold,
                  fontSize: 45),
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            const Text('Home of Shoes', style: TextStyle(
                color: Colors.purple, fontWeight: FontWeight.bold,
                fontSize: 25),
            ),
            const SizedBox(
              height: 13,
            ),
            const Text('Version 1.1.0', style: TextStyle(
                color: Colors.purple,
                fontSize: 17),
            ),
            const SizedBox(
              height: 13,
            ),
            const Text('© 2024 Zion Inc.', style: TextStyle(
                color: Colors.purple,
                fontSize: 17),
            ),
          ],
        ),
      ),
    );
  }
}
