import 'package:fpdart/fpdart.dart';
import 'package:movie_app/core/network/entity/failure.dart';
import 'package:movie_app/features/home/domain/entity/cast_entity.dart';
import 'package:movie_app/features/home/domain/entity/movie_detail_entity.dart';
import 'package:movie_app/features/home/domain/entity/movie_entity.dart';

abstract class HomeRepository {
  Future<Either<Failure, List<MovieEntity>>> getNowPlaying(List<String> genresList);

  Future<Either<Failure, List<MovieEntity>>> getPopular(List<String> genresList, int duration);

  Future<Either<Failure, MovieDetailEntity>> getMovieDetail(int idMovie, List<CastEntity> listCast);

  Future<Either<Failure, List<CastEntity>>> getCast(int idMovie);

}
