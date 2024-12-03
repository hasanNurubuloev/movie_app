import 'package:movie_app/features/home/data/model/cast_model.dart';
import 'package:movie_app/features/home/data/model/movie_detail_model.dart';
import 'package:movie_app/features/home/data/model/movie_model.dart';

abstract class HomeDataSource {
  Future<List<MovieModel>> getNowPlaying();
  Future<List<MovieModel>> getPopular();
  Future<MovieDetailModel> getMovieDetail(int idMovie);
  Future<List<CastModel>> getCast(int idMovie);

}