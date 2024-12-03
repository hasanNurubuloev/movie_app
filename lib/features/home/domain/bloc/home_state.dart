part of 'home_bloc.dart';

@freezed
class HomeState  with _$HomeState{
  const factory HomeState({
    required final StateStatus stateStatus,
    required final List<MovieEntity> filmsNowPlaying,
    required final List<MovieEntity> filmsPopular,
    required final List<MovieDetailEntity> movieDetailNowPlaying,
    required final List<MovieDetailEntity> movieDetailPopular,
    required final Map<int, List<CastEntity>> movieNowPlayingCasts,
    required final Map<int, List<CastEntity>> moviePopularCasts
  }) = _HomeState;
}

