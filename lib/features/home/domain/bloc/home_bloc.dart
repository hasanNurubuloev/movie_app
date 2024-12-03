import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:bloc_concurrency/bloc_concurrency.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:movie_app/core/network/entity/state_status.dart';
import 'package:movie_app/features/home/domain/entity/cast_entity.dart';
import 'package:movie_app/features/home/domain/entity/movie_detail_entity.dart';
import 'package:movie_app/features/home/domain/entity/movie_entity.dart';
import 'package:movie_app/features/home/domain/repository/home_repository.dart';

part 'home_bloc.freezed.dart';
part 'home_event.dart';
part 'home_state.dart';

@injectable
class HomeBloc extends Bloc<HomeEvent, HomeState> {
  final HomeRepository _repository;

  HomeBloc(this._repository)
      : super(
          const HomeState(
            stateStatus: StateStatus.initial(),
            filmsNowPlaying: [],
            filmsPopular: [],
            movieDetailNowPlaying: [],
            movieDetailPopular: [],
            movieNowPlayingCasts: {},
            moviePopularCasts: {},
          ),
        ) {
    on<_NowPlayingFilms>(_onGetNowPlaying);
    on<_PopularFilms>(_onGetPopular);
    on<_MovieDetailNowPlaying>(_onGetMoviesDetailNowPlaying, transformer: sequential());
    on<_MovieDetailsPopular>(_onGetMoviesDetailPopular, transformer: sequential());
    on<_MoviesCastNowPlaying>(_onGetMoviesNowPlayingCast, transformer: sequential());
    on<_MoviesPopularCast>(_onGetMoviesPopularCast, transformer: sequential());
  }

  FutureOr<void> _onGetNowPlaying(_NowPlayingFilms event, Emitter<HomeState> emit) async {
    emit(state.copyWith(stateStatus: const StateStatus.loading()));
    final result = await _repository.getNowPlaying([]);

    result.fold((l) {
      emit(state.copyWith(stateStatus: StateStatus.failure(message: l.message ?? l.toString())));
    }, (r) {
      emit(state.copyWith(stateStatus: const StateStatus.success('now'), filmsNowPlaying: r));
    });
  }

  FutureOr<void> _onGetPopular(_PopularFilms event, Emitter<HomeState> emit) async {
    emit(state.copyWith(stateStatus: const StateStatus.loading()));
    final result = await _repository.getPopular([], 0);

    result.fold((l) {
      emit(state.copyWith(stateStatus: StateStatus.failure(message: l.message ?? l.toString())));
    }, (r) {
      emit(state.copyWith(stateStatus: const StateStatus.success(true), filmsPopular: r));
    });
  }

  FutureOr<void> _onGetMoviesDetailPopular(_MovieDetailsPopular event, Emitter<HomeState> emit) async {
    emit(state.copyWith(stateStatus: const StateStatus.loading()));
    final result = await _repository.getMovieDetail(event.idMovie, []);

    result.fold((l) {
      emit(state.copyWith(stateStatus: StateStatus.failure(message: l.message ?? l.toString())));
    }, (r) {
      List<MovieDetailEntity> moviesDetailList = [...state.movieDetailPopular];
      moviesDetailList.add(r);
      emit(state.copyWith(stateStatus: const StateStatus.success(), movieDetailPopular: moviesDetailList));
    });
  }

  FutureOr<void> _onGetMoviesPopularCast(_MoviesPopularCast event, Emitter<HomeState> emit) async {
    emit(state.copyWith(stateStatus: const StateStatus.loading()));
    final result = await _repository.getCast(event.idMovie);

    result.fold((l) {
      emit(state.copyWith(stateStatus: StateStatus.failure(message: l.message ?? l.toString())));
    }, (r) {
      final updatedCastsMap = Map<int, List<CastEntity>>.from(state.moviePopularCasts);
      updatedCastsMap[event.idMovie] = r;
      emit(state.copyWith(stateStatus: const StateStatus.success(true), moviePopularCasts: updatedCastsMap));
    });
  }
  FutureOr<void> _onGetMoviesDetailNowPlaying(_MovieDetailNowPlaying event, Emitter<HomeState> emit) async {
    emit(state.copyWith(stateStatus: const StateStatus.loading()));
    final result = await _repository.getMovieDetail(event.idMovie, event.listCast);

    result.fold((l) {
      emit(state.copyWith(stateStatus: StateStatus.failure(message: l.message ?? l.toString())));
    }, (r) {
      List<MovieDetailEntity> moviesDetailList = [...state.movieDetailNowPlaying];
      moviesDetailList.add(r);
      emit(state.copyWith(stateStatus: const StateStatus.success(), movieDetailNowPlaying: moviesDetailList));
    });
  }

  FutureOr<void> _onGetMoviesNowPlayingCast(_MoviesCastNowPlaying event, Emitter<HomeState> emit) async {
    emit(state.copyWith(stateStatus: const StateStatus.loading()));
    final result = await _repository.getCast(event.idMovie);

    result.fold((l) {
      emit(state.copyWith(stateStatus: StateStatus.failure(message: l.message ?? l.toString())));
    }, (r) {
      final updatedCastsMap = Map<int, List<CastEntity>>.from(state.movieNowPlayingCasts);
      updatedCastsMap[event.idMovie] = r;
      emit(state.copyWith(stateStatus: const StateStatus.success(true), movieNowPlayingCasts: updatedCastsMap));
    });
  }
}
