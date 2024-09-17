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
class HomeGetMovieDetailsEvent extends HomeEvent with _$HomeGetMovieDetailsEvent {
  const factory HomeGetMovieDetailsEvent.getMovieDetails(int idMovie) = _MovieDetails;
}
