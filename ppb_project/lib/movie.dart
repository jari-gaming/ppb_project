class Movie {
  final int id;
  final String title;
  final String director;
  final int year;
  final String posterUrl;

  Movie({
    required this.id,
    required this.title,
    required this.director,
    required this.year,
    required this.posterUrl,
  });

  // Factory constructor untuk membuat instance Movie dari JSON
  factory Movie.fromJson(Map<String, dynamic> json) {
    return Movie(
      id: json['id'],
      title: json['title'],
      director: json['director'],
      year: json['year'],
      posterUrl: json['poster_url'],
    );
  }
}