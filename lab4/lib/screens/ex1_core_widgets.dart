import 'package:flutter/material.dart';

class Ex1CoreWidgets extends StatelessWidget {
  const Ex1CoreWidgets({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Exercise 1"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            const Text(
              "Flutter UI Demo",
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 20),

            const Icon(
              Icons.favorite,
              size: 50,
              color: Colors.red,
            ),

            const SizedBox(height: 20),

            Image.network(
              "pic/kbuong.jpg",
              height: 300,
            ),

            const SizedBox(height: 20),

            const Card(
              child: ListTile(
                leading: Icon(Icons.person),
                title: Text("Minh Duong"),
                subtitle: Text("Flutter Student"),
              ),
            ),
          ],
        ),
      ),
    );
  }
}