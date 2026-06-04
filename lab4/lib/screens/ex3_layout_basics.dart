import 'package:flutter/material.dart';

class Ex3LayoutBasics extends StatelessWidget {
  const Ex3LayoutBasics({super.key});

  @override
  Widget build(BuildContext context) {
    final List<String> movies = [
      "Avengers",
      "Batman",
      "Spider-Man",
      "Iron Man",
      "Joker",
      "Doctor Strange",
      "Black Panther",
      "Thor",
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text("Exercise 3"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            const Text(
              "Popular Movies",
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 16),

            Row(
              mainAxisAlignment:
              MainAxisAlignment.spaceEvenly,
              children: const [
                Icon(Icons.movie, size: 35),
                Icon(Icons.star, size: 35),
                Icon(Icons.favorite, size: 35),
              ],
            ),

            const SizedBox(height: 16),

            const Align(
              alignment: Alignment.centerLeft,
              child: Text(
                "Movie List",
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),

            const SizedBox(height: 12),

            Expanded(
              child: ListView.builder(
                itemCount: movies.length,
                itemBuilder: (context, index) {
                  return Card(
                    margin: const EdgeInsets.only(
                      bottom: 8,
                    ),
                    child: ListTile(
                      leading: const Icon(Icons.movie),
                      title: Text(movies[index]),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}