class Movie {
  final int id;
  final String title;
  final String posterPath;
  final String overview;
  final List<String> genres;
  final double rating;
  final List<String> trailers;

  Movie({
    required this.id,
    required this.title,
    required this.posterPath,
    required this.overview,
    required this.genres,
    required this.rating,
    required this.trailers,
  });
}