import 'package:auto_route/auto_route.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_cache_manager/flutter_cache_manager.dart';
import 'package:movie_app/core/app/router/app_router.gr.dart';
import 'package:movie_app/features/home/domain/bloc/home_bloc.dart';
import 'package:movie_app/features/home/presentation/widgets/widget_list_genres.dart';

class SliverWidgetListPopular extends StatelessWidget {
  static final customCacheManager =
      CacheManager(Config('customCacheKey', stalePeriod: const Duration(days: 15), maxNrOfCacheObjects: 100));

  const SliverWidgetListPopular({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: BlocConsumer<HomeBloc, HomeState>(
        listener: (context, state) {
          state.stateStatus.whenOrNull(success: (val) {
            if (val is bool && state.filmsPopular.isNotEmpty && state.movieDetailPopular.isEmpty) {
              for (var e in state.filmsPopular) {
                context.read<HomeBloc>().add(HomeGetMovieDetailsPopularEvent.getMovieDetailsPopular(e.id));
               context.read<HomeBloc>().add(HomeGetMoviesPopularCast.getMoviesPopularCast(e.id));
              }
            }
          });
        },
        builder: (context, state) {
          if (state.movieDetailPopular.length != state.filmsPopular.length && state.filmsPopular.isNotEmpty) {
            return const SizedBox();
          }
          return SizedBox(
            height: (140 * state.filmsPopular.length).toDouble(),
            child: ListView.builder(
              physics: const NeverScrollableScrollPhysics(),
              itemCount: state.filmsPopular.length,
              itemBuilder: (_, index) {
                return GestureDetector(
                  onTap: () {
                    final movieDetail = state.movieDetailPopular[index];

                    context.router.push(DetailMovieRoute(
                        movieDetailEntity: movieDetail, listCastEntity: state.moviePopularCasts[movieDetail.id] ?? []));
                  },
                  child: SizedBox(
                    height: 140,
                    child: Padding(
                      padding: const EdgeInsets.only(bottom: 16),
                      child: Row(
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.circular(10),
                            child: CachedNetworkImage(
                              cacheManager: customCacheManager,
                              imageUrl: state.filmsPopular[index].image,
                              placeholder: (context, url) => const CircularProgressIndicator(),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 16),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                SizedBox(
                                  child: Text(
                                    '${state.filmsPopular[index].title}\n',
                                    maxLines: 2,
                                    overflow: TextOverflow.ellipsis,
                                    style: const TextStyle(fontWeight: FontWeight.bold),
                                  ),
                                ),
                                RichText(
                                  text: TextSpan(
                                    children: [
                                      const WidgetSpan(
                                        child: Padding(
                                          padding: EdgeInsets.only(right: 4),
                                          child: Icon(
                                            Icons.star,
                                            color: Colors.yellow,
                                            size: 16,
                                          ),
                                        ),
                                      ),
                                      TextSpan(
                                        text: '${state.filmsPopular[index].rating.toStringAsFixed(1)}/10 IMDb',
                                        style: const TextStyle(color: Colors.grey),
                                      )
                                    ],
                                  ),
                                ),
                                ListGenresWidget(listGenres: state.movieDetailPopular[index].listGenres),
                                RichText(
                                  text: TextSpan(
                                    children: [
                                      const WidgetSpan(
                                        child: Padding(
                                          padding: EdgeInsets.only(right: 4),
                                          child: Icon(
                                            Icons.watch_later_outlined,
                                            color: Colors.black,
                                            size: 16,
                                          ),
                                        ),
                                      ),
                                      TextSpan(
                                        text: state.movieDetailPopular[index].duration > 60
                                            ? '${(state.movieDetailPopular[index].duration ~/ 60)}h ${state.movieDetailPopular[index].duration % 60}m'
                                            : '${state.movieDetailPopular[index].duration}m',
                                        style: const TextStyle(color: Colors.grey, letterSpacing: 1),
                                      ),
                                    ],
                                  ),
                                ),
                                const SizedBox(height: 8)
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                );
              },
            ),
          );
        },
      ),
    );
  }
}
