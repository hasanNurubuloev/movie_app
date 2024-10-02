import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:fpdart/src/either.dart';
import 'package:injectable/injectable.dart';
import 'package:movie_app/core/network/entity/failure.dart';
import 'package:movie_app/core/network/http_path.dart';
import 'package:movie_app/features/home/data/data_source/home_data_source.dart';
import 'package:movie_app/features/home/domain/entity/cast_entity.dart';
import 'package:movie_app/features/home/domain/entity/movie_detail_entity.dart';
import 'package:movie_app/features/home/domain/entity/movie_entity.dart';
import 'package:movie_app/features/home/domain/repository/home_repository.dart';

@Injectable(as: HomeRepository)
class HomeRepositoryImpl extends HomeRepository {
  final HomeDataSource _dataSource;

  HomeRepositoryImpl(this._dataSource);

  @override
  Future<Either<Failure, List<MovieEntity>>> getNowPlaying(List<String> genresList) async {
    try {
      debugPrint('Reuest____________________________________________________--');
      final result = await _dataSource.getNowPlaying();
      print('---------Result request $result');
      List<MovieEntity> filmsList = result
          .map((e) => MovieEntity(
              id: e.id,
              image: HttpPath.baseUrlImages + e.posterPath,
              title: e.title,
              rating: e.voteAverage,
              genreslist: genresList,
              duration: '99'))
          .cast<MovieEntity>()
          .toList();
      return Right(filmsList);
    } catch (e) {
      return Left(Failure.request());
    }
  }

  @override
  Future<Either<Failure, List<MovieEntity>>> getPopular(List<String> genresList, int duration) async {
    try {
      final response = await _dataSource.getPopular();
      List<MovieEntity> popularFilms = response
          .map((e) => MovieEntity(
              id: e.id,
              image: HttpPath.baseUrlImages + e.posterPath,
              title: e.title,
              rating: e.voteAverage,
              genreslist: genresList,
              duration: duration.toString()))
          .toList();
      return Right(popularFilms);
    } catch (e) {
      return Left(Failure.request());
    }
  }

  @override
  Future<Either<Failure, MovieDetailEntity>> getMovieDetail(int idMovie, List<CastEntity> listCast) async {
    try {
      final response = await _dataSource.getMovieDetail(idMovie);
      MovieDetailEntity movieDetail = MovieDetailEntity(
          listGenres: response.genres.map((e) => e.nameMovie).toList(),
          duration: response.runtime,
          name: response.originalTitle,
          originalLanguage: response.originalLanguage,
          overview: response.overview,
          spokenLanguage: response.spokenLanguage,
          voteAverage: response.voteAverage,
          listCast: listCast
      );
      return Right(movieDetail);
    } catch (e) {
      return Left(Failure.request());
    }
  }

  @override
  Future<Either<Failure, CastEntity>> getCast(int idMovie) async {
    try {
      final response = await _dataSource.getCast(idMovie);
      CastEntity castEntity = CastEntity(name: response.name ?? 'error', profilePath: response.profilePath ?? 'error');
      return Right(castEntity);
    } catch (e) {
      return Left(Failure.request());
    }
  }

  @override
  Future<Either<Failure, List<String>>> getGenres(int idMovie) async {
    try {
      final response = await _dataSource.getGenres(idMovie);
      List<String> listGenres = response.map((e) => response.map((e) => e.nameMovie)).cast<String>().toList();
      return Right(listGenres);
    } catch (e) {
      return Left(Failure.request());
    }
  }
}
