// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i3;
import 'package:flutter/material.dart' as _i5;
import 'package:movie_app/features/detail_movie/presentation/detail_movie_screen.dart'
    as _i1;
import 'package:movie_app/features/home/domain/entity/movie_detail_entity.dart'
    as _i4;
import 'package:movie_app/features/home/presentation/home_screen.dart' as _i2;

/// generated route for
/// [_i1.DetailMovieScreen]
class DetailMovieRoute extends _i3.PageRouteInfo<DetailMovieRouteArgs> {
  DetailMovieRoute({
    required _i4.MovieDetailEntity movieDetailEntity,
    _i5.Key? key,
    List<_i3.PageRouteInfo>? children,
  }) : super(
          DetailMovieRoute.name,
          args: DetailMovieRouteArgs(
            movieDetailEntity: movieDetailEntity,
            key: key,
          ),
          initialChildren: children,
        );

  static const String name = 'DetailMovieRoute';

  static _i3.PageInfo page = _i3.PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<DetailMovieRouteArgs>();
      return _i1.DetailMovieScreen(
        args.movieDetailEntity,
        key: args.key,
      );
    },
  );
}

class DetailMovieRouteArgs {
  const DetailMovieRouteArgs({
    required this.movieDetailEntity,
    this.key,
  });

  final _i4.MovieDetailEntity movieDetailEntity;

  final _i5.Key? key;

  @override
  String toString() {
    return 'DetailMovieRouteArgs{movieDetailEntity: $movieDetailEntity, key: $key}';
  }
}

/// generated route for
/// [_i2.HomeScreen]
class HomeRoute extends _i3.PageRouteInfo<void> {
  const HomeRoute({List<_i3.PageRouteInfo>? children})
      : super(
          HomeRoute.name,
          initialChildren: children,
        );

  static const String name = 'HomeRoute';

  static _i3.PageInfo page = _i3.PageInfo(
    name,
    builder: (data) {
      return const _i2.HomeScreen();
    },
  );
}
