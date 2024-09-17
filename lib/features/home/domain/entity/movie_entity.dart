class MovieEntity {
  final int id;
  final String image;
  final String title;
  final double rating;
  final List<String> genreslist;
  final String duration;

  MovieEntity({
    required this.id,
    required this.image,
    required this.title,
    required this.rating,
    required this.genreslist,
    required this.duration,
  });
}
