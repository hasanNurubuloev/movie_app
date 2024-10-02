import 'package:auto_route/auto_route.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_cache_manager/flutter_cache_manager.dart';
import 'package:movie_app/core/app/router/app_router.gr.dart';
import 'package:movie_app/features/home/domain/bloc/home_bloc.dart';

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
            if (val is bool && state.filmsPopular.isNotEmpty && state.movieDetail.isEmpty) {
              for (var e in state.filmsPopular) {
                print('ololo id  ${e.id}');
                context.read<HomeBloc>().add(HomeGetMovieDetailsEvent.getMovieDetails(e.id));
                context.read<HomeBloc>().add(HomeGetMoviesCast.getMoviesCast(e.id));
              }
            }
          });
        },
        builder: (context, state) {
          debugPrint('olololololololo ${state.movieDetail.length} == ${state.filmsPopular.length}');
          if (state.movieDetail.length != state.filmsPopular.length && state.filmsPopular.isNotEmpty) {
            return const SizedBox();
          }
          return SizedBox(
            height: (140 * state.filmsPopular.length).toDouble(),
            child: ListView.builder(
              physics: const NeverScrollableScrollPhysics(),
              itemCount: state.filmsPopular.length,
              itemBuilder: (_, index) {
                return GestureDetector(
                  onTap: (){
                    context.router.push(DetailMovieRoute(movieDetailEntity: state.movieDetail[index]));
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
                            padding: const EdgeInsets.symmetric(horizontal: 16),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                SizedBox(
                                  width: MediaQuery.of(context).size.width - 170,
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
                                SizedBox(
                                  width: MediaQuery.of(context).size.width - 164,
                                  height: 20,
                                  child: ListView.builder(
                                    scrollDirection: Axis.horizontal,
                                    itemCount: state.movieDetail[index].listGenres.length,
                                    itemBuilder: (_, i) {
                                      return Row(
                                        children: [
                                          Container(
                                            width: 60,
                                            decoration: BoxDecoration(
                                              border: Border.all(
                                                color: Colors.lightBlueAccent,
                                              ),
                                              borderRadius: BorderRadius.circular(20),
                                            ),
                                            child: Text(
                                              state.movieDetail[index].listGenres[i],
                                              textAlign: TextAlign.center,
                                              style: TextStyle(
                                                fontSize: 12,
                                                color: Colors.blue[400],
                                              ),
                                            ),
                                          ),
                                          const SizedBox(width: 8)
                                        ],
                                      );
                                    },
                                  ),
                                ),
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
                                        text: state.movieDetail[index].duration > 60
                                            ? '${(state.movieDetail[index].duration ~/ 60)}h ${state.movieDetail[index].duration % 60}m'
                                            : '${state.movieDetail[index].duration}m',
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
