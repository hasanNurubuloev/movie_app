part of 'home_bloc.dart';


 abstract class HomeEvent {}
@freezed
class HomeGetNowPlayingEvent extends HomeEvent with _$HomeGetNowPlayingEvent {
  const factory HomeGetNowPlayingEvent.getNowPlayingFilms() = _NowPlayingFilms;
}
@freezed
class HomeGetPopularEvent extends HomeEvent with _$HomeGetPopularEvent {
  const factory HomeGetPopularEvent.getPopularFilms() = _PopularFilms;
}
@freezed
class HomeGetMovieDetailsPopularEvent extends HomeEvent with _$HomeGetMovieDetailsPopularEvent {
  const factory HomeGetMovieDetailsPopularEvent.getMovieDetailsPopular(int idMovie) = _MovieDetailsPopular;
}
@freezed
class HomeGetMovieNowPlayingDetailEvent extends HomeEvent with _$HomeGetMovieNowPlayingDetailEvent {
  const factory HomeGetMovieNowPlayingDetailEvent.getMovieNowPlayingDetail(int idMovie, List<CastEntity> listCast) = _MovieDetailNowPlaying;
}
@freezed
class HomeGetMoviesPopularCast extends HomeEvent with _$HomeGetMoviesPopularCast {
  const factory HomeGetMoviesPopularCast.getMoviesPopularCast(int idMovie) = _MoviesPopularCast;
}
@freezed
class HomeGetMoviesNowPlayingCast extends HomeEvent with _$HomeGetMoviesNowPlayingCast{
  const factory HomeGetMoviesNowPlayingCast.getMoviesNowPlayingCast(int idMovie) = _MoviesCastNowPlaying;
}
