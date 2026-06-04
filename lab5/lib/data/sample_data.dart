import '../models/movie.dart';

final List<Movie> movies = [
  Movie(
    id: 1,
    title: "Iron Man",
    posterPath:
    "image/iron-mab-no-iron-man.gif",
    overview:
    "After the devastating events of Infinity War, the Avengers assemble once more.",
    genres: ["Action", "Adventure", "Sci-Fi"],
    rating: 8.9,
    trailers: [
      "Official Trailer",
      "Final Trailer",
      "TV Spot"
    ],
  ),

  Movie(
    id: 2,
    title: "The Batman",
    posterPath:
    "image/batman-funny.gif",
    overview:
    "Batman uncovers corruption in Gotham City while pursuing the Riddler.",
    genres: ["Action", "Crime", "Drama"],
    rating: 8.1,
    trailers: [
      "Main Trailer",
      "Behind The Scenes"
    ],
  ),

  Movie(
    id: 3,
    title: "Interstellar",
    posterPath:
    "image/Interstellar.jpg",
    overview:
    "A team of explorers travel through a wormhole in space.",
    genres: ["Adventure", "Drama", "Sci-Fi"],
    rating: 8.7,
    trailers: [
      "Trailer 1",
      "Trailer 2"
    ],
  ),
];