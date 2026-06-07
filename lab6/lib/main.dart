import 'package:flutter/material.dart';

void main() {
  runApp(const ResponsiveMovieApp());
}

class ResponsiveMovieApp extends StatelessWidget {
  const ResponsiveMovieApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: GenreScreen(),
    );
  }
}

class Movie {
  final String title;
  final int year;
  final List<String> genres;
  final String posterPath;
  final double rating;

  Movie({
    required this.title,
    required this.year,
    required this.genres,
    required this.posterPath,
    required this.rating,
  });
}

final List<Movie> allMovies = [
  Movie(
    title: "Iron Man",
    year: 2019,
    genres: ["Action", "Sci-Fi"],
    posterPath:
    "image/iron-mab-no-iron-man.gif",
    rating: 8.4,
  ),
  Movie(
    title: "DemonSlayer",
    year: 1997,
    genres: ["Drama", "Romance"],
    posterPath:
    "image/zenitsu.jpg",
    rating: 7.9,
  ),
  Movie(
    title: "Bat Man",
    year: 2019,
    genres: ["Drama"],
    posterPath:
    "image/batman-funny.gif",
    rating: 8.5,
  ),
  Movie(
    title: "Toy Story",
    year: 1995,
    genres: ["Comedy"],
    posterPath:
    "image/toystory.gif",
    rating: 8.0,
  ),
  Movie(
    title: "Interstellar",
    year: 2014,
    genres: ["Sci-Fi", "Drama"],
    posterPath:
    "image/Interstellar.jpg",
    rating: 8.7,
  ),
  Movie(
    title: "Ohnepixel",
    year: 2008,
    genres: ["Action", "Drama"],
    posterPath:
    "image/goldgoldgold.jpg",
    rating: 9.0,
  ),
];

class GenreScreen extends StatefulWidget {
  const GenreScreen({super.key});

  @override
  State<GenreScreen> createState() => _GenreScreenState();
}

class _GenreScreenState extends State<GenreScreen> {
  String searchQuery = "";
  String selectedSort = "A-Z";

  final List<String> genres = [
    "Action",
    "Drama",
    "Comedy",
    "Sci-Fi",
    "Romance",
  ];

  final Set<String> selectedGenres = {};

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    List<Movie> visibleMovies = allMovies.where((movie) {
      bool matchesSearch = movie.title
          .toLowerCase()
          .contains(searchQuery.toLowerCase());

      bool matchesGenre = selectedGenres.isEmpty ||
          movie.genres.any(
                (genre) => selectedGenres.contains(genre),
          );

      return matchesSearch && matchesGenre;
    }).toList();

    switch (selectedSort) {
      case "A-Z":
        visibleMovies.sort(
              (a, b) => a.title.compareTo(b.title),
        );
        break;

      case "Z-A":
        visibleMovies.sort(
              (a, b) => b.title.compareTo(a.title),
        );
        break;

      case "Year":
        visibleMovies.sort(
              (a, b) => b.year.compareTo(a.year),
        );
        break;

      case "Rating":
        visibleMovies.sort(
              (a, b) => b.rating.compareTo(a.rating),
        );
        break;
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text("Movie Browser"),
        centerTitle: true,
      ),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(
            screenWidth > 800 ? 24 : 16,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                "Find a Movie",
                style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                ),
              ),

              const SizedBox(height: 20),

              // SEARCH BAR
              TextField(
                decoration: InputDecoration(
                  hintText: "Search movie...",
                  prefixIcon: const Icon(Icons.search),
                  border: OutlineInputBorder(
                    borderRadius:
                    BorderRadius.circular(15),
                  ),
                ),
                onChanged: (value) {
                  setState(() {
                    searchQuery = value;
                  });
                },
              ),

              const SizedBox(height: 16),

              // SELECTED BADGE
              Row(
                children: [
                  const Text(
                    "Genres",
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const Spacer(),
                  Chip(
                    label: Text(
                      "${selectedGenres.length} selected",
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 10),

              // WRAP CHIPS
              Wrap(
                spacing: 8,
                runSpacing: 8,
                children: genres.map((genre) {
                  return FilterChip(
                    label: Text(genre),
                    selected:
                    selectedGenres.contains(genre),
                    onSelected: (selected) {
                      setState(() {
                        if (selected) {
                          selectedGenres.add(genre);
                        } else {
                          selectedGenres.remove(genre);
                        }
                      });
                    },
                  );
                }).toList(),
              ),

              const SizedBox(height: 16),

              // SORT + CLEAR
              Row(
                children: [
                  Expanded(
                    child: DropdownButtonFormField<String>(
                      value: selectedSort,
                      decoration:
                      const InputDecoration(
                        border:
                        OutlineInputBorder(),
                        labelText: "Sort By",
                      ),
                      items: const [
                        DropdownMenuItem(
                          value: "A-Z",
                          child: Text("A-Z"),
                        ),
                        DropdownMenuItem(
                          value: "Z-A",
                          child: Text("Z-A"),
                        ),
                        DropdownMenuItem(
                          value: "Year",
                          child: Text("Year"),
                        ),
                        DropdownMenuItem(
                          value: "Rating",
                          child: Text("Rating"),
                        ),
                      ],
                      onChanged: (value) {
                        setState(() {
                          selectedSort = value!;
                        });
                      },
                    ),
                  ),
                  const SizedBox(width: 10),
                  ElevatedButton(
                    onPressed: () {
                      setState(() {
                        searchQuery = "";
                        selectedGenres.clear();
                        selectedSort = "A-Z";
                      });
                    },
                    child: const Text("Clear"),
                  ),
                ],
              ),

              const SizedBox(height: 20),

              Text(
                "${visibleMovies.length} movies found",
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),

              const SizedBox(height: 10),

              // RESPONSIVE MOVIE LIST
              Expanded(
                child: LayoutBuilder(
                  builder: (context, constraints) {
                    if (constraints.maxWidth < 800) {
                      return ListView.builder(
                        itemCount:
                        visibleMovies.length,
                        itemBuilder:
                            (context, index) {
                          return buildMovieCard(
                            visibleMovies[index],
                          );
                        },
                      );
                    }

                    return GridView.count(
                      crossAxisCount: 2,
                      crossAxisSpacing: 12,
                      mainAxisSpacing: 12,
                      childAspectRatio: 2.4,
                      children: visibleMovies
                          .map(buildMovieCard)
                          .toList(),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildMovieCard(Movie movie) {
    return Card(
      elevation: 4,
      child: LayoutBuilder(
        builder: (context, constraints) {
          double imageWidth =
          constraints.maxWidth > 400
              ? 130
              : 100;

          return Padding(
            padding: const EdgeInsets.all(8),
            child: Row(
              children: [
                ClipRRect(
                  borderRadius:
                  BorderRadius.circular(10),
                  child: Image.network(
                    movie.posterPath,
                    width: imageWidth,
                    height: 150,
                    fit: BoxFit.cover,
                  ),
                ),

                const SizedBox(width: 12),

                Expanded(
                  child: Column(
                    mainAxisAlignment:
                    MainAxisAlignment.center,
                    crossAxisAlignment:
                    CrossAxisAlignment.start,
                    children: [
                      Text(
                        movie.title,
                        style: const TextStyle(
                          fontSize: 18,
                          fontWeight:
                          FontWeight.bold,
                        ),
                      ),

                      const SizedBox(height: 8),

                      Text(
                        "Year: ${movie.year}",
                      ),

                      const SizedBox(height: 4),

                      Text(
                        "Genres: ${movie.genres.join(", ")}",
                      ),

                      const SizedBox(height: 4),

                      Row(
                        children: [
                          const Icon(
                            Icons.star,
                            color: Colors.amber,
                            size: 18,
                          ),
                          const SizedBox(width: 4),
                          Text(
                            movie.rating.toString(),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}