import 'dart:async';
import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:movie_app/core/network/entity/state_status.dart';
import 'package:movie_app/features/home/data/data_source/impl/home_data_source_impl.dart';
import 'package:movie_app/features/home/domain/entity/movie_detail_entity.dart';
import 'package:movie_app/features/home/domain/entity/movie_entity.dart';
import 'package:movie_app/features/home/domain/repository/home_repository.dart';
import 'package:movie_app/injection/injection.dart';


part 'home_bloc.freezed.dart';
part 'home_event.dart';
part 'home_state.dart';

@injectable
class HomeBloc extends Bloc<HomeEvent, HomeState> {
  final HomeRepository _repository;
  HomeBloc(this._repository) : super(const HomeState(stateStatus: StateStatus.initial(), filmsNowPlaying: [], filmsPopular: [], movieDetail: [])) {
    on<_NowPlayingFilms>(_onGetNowPlaying);
    on<_PopularFilms>(_onGetPopular);
    on<_MovieDetails>(_onGetMoviesDetail);
  }

  FutureOr<void> _onGetNowPlaying(_NowPlayingFilms event, Emitter<HomeState> emit) async {
    emit(state.copyWith(stateStatus: const StateStatus.loading()));
    final result = await _repository.getNowPlaying([]);

    result.fold((l){
      emit(state.copyWith(stateStatus:  StateStatus.failure(message: l.message ?? l.toString())));
    }, (r){
      emit(state.copyWith(stateStatus:  const StateStatus.success(), filmsNowPlaying: r));
    });
  }
  FutureOr<void> _onGetPopular(_PopularFilms event, Emitter<HomeState> emit) async {
    emit(state.copyWith(stateStatus: const StateStatus.loading()));
    final result = await _repository.getPopular([]);

    result.fold((l){
      emit(state.copyWith(stateStatus: StateStatus.failure(message: l.message ?? l.toString())));
    },(r){
      emit(state.copyWith(stateStatus:  const StateStatus.success(true), filmsPopular: r));
    });
  }
  FutureOr<void> _onGetMoviesDetail(_MovieDetails event, Emitter<HomeState> emit) async {

    emit(state.copyWith(stateStatus: const StateStatus.loading()));
    final result = await _repository.getMovieDetail(event.idMovie);

    result.fold((l){
      emit(state.copyWith(stateStatus: StateStatus.failure(message: l.message ?? l.toString())));
    },(r){
      List<MovieDetailEntity> moviesDetailList =[...state.movieDetail];
      moviesDetailList.add(r);
      emit(state.copyWith(stateStatus:  const StateStatus.success(), movieDetail: moviesDetailList));
    });
  }


}
