import 'package:movie_app/features/home/data/model/spoken_language_model.dart';
import 'package:movie_app/features/home/domain/entity/cast_entity.dart';

class MovieDetailEntity {
  final String name;
  final double voteAverage;
  final List<String> listGenres;
  final int duration;
  final String originalLanguage;
  final List<SpokenLanguageModel> spokenLanguage;
  final String overview;
  final List<CastEntity> listCast;

  MovieDetailEntity(
      {required this.name,
      required this.voteAverage,
      required this.listGenres,
      required this.duration,
      required this.originalLanguage,
      required this.spokenLanguage,
      required this.overview,
      required this.listCast});

  @override
  String toString() {
    return 'MovieDetailEntity{name: $name, voteAverage: $voteAverage, listGenres: $listGenres, duration: $duration, originalLanguage: $originalLanguage, spokenLanguage: $spokenLanguage, overview: $overview, listCast: $listCast}';
  }
}

