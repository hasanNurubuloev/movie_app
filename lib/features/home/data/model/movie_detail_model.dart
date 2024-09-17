import 'package:movie_app/features/home/data/model/genres_model.dart';
import 'package:movie_app/features/home/data/model/production_companies_model.dart';
import 'package:movie_app/features/home/data/model/production_countries_model.dart';
import 'package:movie_app/features/home/data/model/spoken_language_model.dart';


class MovieDetailModel {
  final bool adult;
  final String backdropPath;
  final int budget;
  final List<GenresModel> genres;
  final String homepage;
  final int id;
  final String imdbId;
  final List<String> originCountry;
  final String originalLanguage;
  final String originalTitle;
  final String overview;
  final double popularity;
  final String posterPath;
  final List<ProductionCompaniesModel> productionCompanies;
  final List<ProductionCountriesModel> productionCountries;
  final String releaseDate;
  final int revenue;
  final int runtime;
  final List<SpokenLanguageModel> spokenLanguage;
  final String status;
  final String tagline;
  final String title;
  final bool video;
  final double voteAverage;
  final int voteCount;

  MovieDetailModel({
    required this.adult,
    required this.backdropPath,
    required this.budget,
    required this.genres,
    required this.homepage,
    required this.id,
    required this.imdbId,
    required this.originCountry,
    required this.originalLanguage,
    required this.originalTitle,
    required this.overview,
    required this.popularity,
    required this.posterPath,
    required this.productionCompanies,
    required this.productionCountries,
    required this.releaseDate,
    required this.revenue,
    required this.runtime,
    required this.spokenLanguage,
    required this.status,
    required this.tagline,
    required this.title,
    required this.video,
    required this.voteAverage,
    required this.voteCount
  });

  factory MovieDetailModel.fromJson(Map<String, dynamic> json){
    final genres =List<GenresModel>.from(json['genres'].map((e) => GenresModel.fromJson(e as Map<String, dynamic>)));

    return MovieDetailModel(
        adult: json['adult'],
        backdropPath: json['backdrop_path'],
        budget: json['budget'],
        genres: genres,
        homepage: json['homepage'],
        id: json['id'],
        imdbId: json['imdb_id'],
        originCountry: json['origin_country'].cast<String>(),
        originalLanguage: json['original_language'],
        originalTitle: json['original_title'],
        overview: json['overview'],
        posterPath: json['poster_path'],
        popularity: json['popularity'],
        productionCompanies: List<ProductionCompaniesModel>.from(json['production_companies'].map((e) => ProductionCompaniesModel.fromJson(e))),
        releaseDate: json['release_date'],
        productionCountries: List<ProductionCountriesModel>.from(json['production_countries'].map((e)=>ProductionCountriesModel.fromJson(e))),
        revenue: json['revenue'],
        runtime: json['runtime'],
        spokenLanguage: List<SpokenLanguageModel>.from(json['spoken_languages'].map((e) => SpokenLanguageModel.fromJson(e))),
        status: json['status'],
        tagline: json['tagline'],
        title: json['title'],
        video: json['video'],
        voteAverage: json['vote_average'],
        voteCount: json['vote_count']
    );
  }

}
