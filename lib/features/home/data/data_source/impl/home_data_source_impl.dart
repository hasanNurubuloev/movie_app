import 'package:injectable/injectable.dart';
import 'package:movie_app/core/network/http_client.dart';
import 'package:movie_app/core/network/http_path.dart';
import 'package:movie_app/features/home/data/data_source/home_data_source.dart';
import 'package:movie_app/features/home/data/model/cast_model.dart';
import 'package:movie_app/features/home/data/model/movie_detail_model.dart';
import 'package:movie_app/features/home/data/model/movie_model.dart';

@Injectable(as: HomeDataSource)
class HomeDataSourceImpl extends HomeDataSource {
  final HttpClient _client;
  late String duration;

  HomeDataSourceImpl(this._client);

  @override
  Future<List<MovieModel>> getNowPlaying() async {
    final response = await _client.get(
      HttpPath.getNowPlaying,
      queryParameters: {
        'language': 'en-US',
        'page': '1',
      },
    );
    final result = (response.data['results'] as List).map((e) => MovieModel.fromJson(e)).toList();
    return result;
  }

  @override
  Future<List<MovieModel>> getPopular() async {
    final response = await _client.get(
      HttpPath.getPopular,
      queryParameters: {
        'language': 'en-US',
        'page': 1,
      },
    );
    final result = (response.data['results'] as List).map((e) => MovieModel.fromJson(e)).toList();
    List<MovieModel> resList = [];
    for (int i = 0; i < 5; i++) {
      resList.add(result[i]);
    }
    return result;
  }

  @override
  Future<MovieDetailModel> getMovieDetail(int idMovie) async {
    final response = await _client.get(
      HttpPath.getMovieDetail(idMovie),
      queryParameters: {
        'language': 'en-US',
      },
    );
    final movieDetail = MovieDetailModel.fromJson(response.data);
    return movieDetail;
  }


  @override
  Future<List<CastModel>> getCast(int idMovie) async {
    final response = await _client.get(
      HttpPath.getCast(idMovie),
      queryParameters: {
        'language': 'en-US',
      },
    );
    //TODO не приходят касты

    return (response.data['cast'] as List).map((e) => CastModel.fromJson(e)).toList();
  }
}
