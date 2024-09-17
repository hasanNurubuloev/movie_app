class GenresModel {
  final int idMovie;
  final String nameMovie;

  GenresModel({required this.idMovie, required this.nameMovie});

  factory GenresModel.fromJson(Map<String, dynamic> json) {
    return GenresModel(
      idMovie: json['id'],
      nameMovie: json['name'],
    );
  }
}
