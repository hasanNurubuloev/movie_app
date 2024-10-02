import 'package:auto_route/auto_route.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_cache_manager/flutter_cache_manager.dart';
import 'package:movie_app/core/app/router/app_router.gr.dart';
import 'package:movie_app/core/network/entity/state_status.dart';
import 'package:movie_app/features/home/domain/bloc/home_bloc.dart';

class SliverWidgetListNowPlaying extends StatefulWidget {
  const SliverWidgetListNowPlaying({super.key});

  @override
  State<SliverWidgetListNowPlaying> createState() => _SliverWidgetListNowPlayingState();
}

class _SliverWidgetListNowPlayingState extends State<SliverWidgetListNowPlaying> {
  static final customCacheManager =
      CacheManager(Config('customCacheKey', stalePeriod: const Duration(days: 15), maxNrOfCacheObjects: 100));

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: BlocConsumer<HomeBloc, HomeState>(
        listener: (context, state) {},
        builder: (context, state) {
          if (state.stateStatus is SuccessStatus) {
            print('ololo $state');
          }
          return SizedBox(
            height: 264,
            child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: state.filmsNowPlaying.length,
                itemBuilder: (_, index) {
                  return GestureDetector(
                    onTap: () {
                      state.movieDetail.forEach((e) => print(e.toString()));
                      // state.movieDetail.map((e) => print(e.name));
                      // print('ololo det index $index name ${state.movieDetail[index].name}');
                      // DetailMovieRoute(movieDetailEntity: state.movieDetail[index].listCast)
                      context.router.push(DetailMovieRoute(movieDetailEntity: state.movieDetail[index]));
                      print("onTap now");
                    },
                    child: SizedBox(
                      width: 140,
                      child: Padding(
                        padding: const EdgeInsets.only(right: 16),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            ClipRRect(
                              borderRadius: BorderRadius.circular(10),
                              child: CachedNetworkImage(
                                cacheManager: customCacheManager,
                                imageUrl: state.filmsNowPlaying[index].image,
                                placeholder: (context, url) => const CircularProgressIndicator(),
                              ),
                            ),
                            const SizedBox(height: 12),
                            Text(
                              '${state.filmsNowPlaying[index].title}\n',
                              maxLines: 2,
                              style: const TextStyle(
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            const SizedBox(height: 8),
                            RichText(
                                text: TextSpan(children: [
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
                                text: '${state.filmsNowPlaying[index].rating.toStringAsFixed(1)}/10 IMDb',
                                style: const TextStyle(color: Colors.grey),
                              )
                            ]))
                          ],
                        ),
                      ),
                    ),
                  );
                }),
          );
        },
      ),
    );
  }
}
