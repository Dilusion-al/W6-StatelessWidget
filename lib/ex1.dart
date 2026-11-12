import 'package:flutter/material.dart';

void main() {
  runApp(
    const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HobbiesScreen(),
    ),
  );
}

class HobbiesScreen extends StatelessWidget {
  const HobbiesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('My Hobbies'),
      ),
      backgroundColor: Colors.grey,
      body: const Padding(
        padding: EdgeInsets.all(40.0), // Outer screen padding (40 on all sides)[cite: 3]
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch, // Makes cards fill full width
          children: [
            HobbyCard(
              title: 'Travelling',
              icon: Icons.travel_explore,
              color: Colors.green,
            ),
            SizedBox(height: 10), // 10px spacing between cards[cite: 3]
            HobbyCard(
              title: 'Skating',
              icon: Icons.skateboarding,
              color: Colors.blueGrey,
            ),
          ],
        ),
      ),
    );
  }
}

class HobbyCard extends StatelessWidget {
  final String title;
  final IconData icon;
  final Color color;

  const HobbyCard({
    super.key,
    required this.title,
    required this.icon,
    this.color = Colors.blue, // Optional with default BLUE value[cite: 4]
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 25, horizontal: 30), // 30px left padding[cite: 3]
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(20), // 20px rounded corners[cite: 3]
      ),
      child: Center(
        child: Row(
          children: [
            Padding(
              padding: const EdgeInsets.only(right: 20.0), // 20px gap between icon and text[cite: 3]
              child: Icon(
                icon,
                color: Colors.white,
                size: 30,
              ),
            ),
            Text(
              title,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 24,
                fontWeight: FontWeight.w500,
              ),
            ),
          ],
        ),
      ),
    );
  }
}