import 'package:injectable/injectable.dart';
import 'package:movie_app/core/network/http_client.dart';
import 'package:movie_app/core/network/http_path.dart';
import 'package:movie_app/features/home/data/data_source/home_data_source.dart';
import 'package:movie_app/features/home/data/model/cast_model.dart';
import 'package:movie_app/features/home/data/model/genres_model.dart';
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
    print('resppppppppppp $response');
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
    print( ' dataSourceId $idMovie');
    final response = await _client.get(
      HttpPath.getMovieDetail(idMovie),
      queryParameters: {
        'language': 'en-US',
      },
    );
    print('getMoviewDetail ${(response.data as Map<String, dynamic>)['id']}');
    final movieDetail = MovieDetailModel.fromJson(response.data);
    return movieDetail;
  }

  @override
  Future<List<GenresModel>> getGenres(int idMovie) async {
    final response = await _client.get(
      HttpPath.getMovieDetail(idMovie),
      queryParameters: {
        'language': 'en-US',
      },
    );
    return (response.data['genres'] as List).map((e) => GenresModel.fromJson(e)).toList();
  }

  @override
  Future<CastModel> getCast(int idMovie) async {
    final response = await _client.get(
      HttpPath.getCast(idMovie),
      queryParameters: {
        'language': 'en-US',
      },
    );
    return CastModel.fromJson(response.data['cast']);
  }
}
