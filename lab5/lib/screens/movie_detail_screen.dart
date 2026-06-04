import 'package:flutter/material.dart';

import '../models/movie.dart';

class MovieDetailScreen extends StatefulWidget {
  final Movie movie;

  const MovieDetailScreen({
    super.key,
    required this.movie,
  });

  @override
  State<MovieDetailScreen> createState() =>
      _MovieDetailScreenState();
}

class _MovieDetailScreenState
    extends State<MovieDetailScreen> {

  bool isFavorite = false;

  @override
  Widget build(BuildContext context) {

    final movie = widget.movie;

    return Scaffold(
      appBar: AppBar(
        title: Text(movie.title),
      ),

      body: SingleChildScrollView(
        child: Column(
          children: [

            // Hero Banner
            Stack(
              children: [
                Image.network(
                  movie.posterPath,
                  height: 300,
                  width: double.infinity,
                  fit: BoxFit.cover,
                ),

                Container(
                  height: 300,
                  decoration: const BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [
                        Colors.transparent,
                        Colors.black54,
                      ],
                    ),
                  ),
                ),
              ],
            ),

            const SizedBox(height: 10),

            // Title
            Text(
              movie.title,
              style: const TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 10),

            // Genres
            Wrap(
              spacing: 8,
              children: movie.genres
                  .map(
                    (genre) => Chip(
                  label: Text(genre),
                ),
              )
                  .toList(),
            ),

            const SizedBox(height: 20),

            // Overview
            Padding(
              padding: const EdgeInsets.all(16),
              child: Text(
                movie.overview,
                style: const TextStyle(
                  fontSize: 16,
                ),
              ),
            ),

            const SizedBox(height: 10),

            // Action Buttons
            Row(
              mainAxisAlignment:
              MainAxisAlignment.spaceEvenly,
              children: [

                IconButton(
                  onPressed: () {
                    setState(() {
                      isFavorite = !isFavorite;
                    });
                  },
                  icon: Icon(
                    isFavorite
                        ? Icons.favorite
                        : Icons.favorite_border,
                    color: Colors.red,
                  ),
                ),

                IconButton(
                  onPressed: () {},
                  icon: const Icon(Icons.star),
                ),

                IconButton(
                  onPressed: () {},
                  icon: const Icon(Icons.share),
                ),
              ],
            ),

            const SizedBox(height: 20),

            const Text(
              "Trailers",
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),

            ListView.builder(
              shrinkWrap: true,
              physics:
              const NeverScrollableScrollPhysics(),
              itemCount: movie.trailers.length,
              itemBuilder: (context, index) {
                return ListTile(
                  leading: const Icon(
                    Icons.play_circle_fill,
                  ),
                  title:
                  Text(movie.trailers[index]),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}