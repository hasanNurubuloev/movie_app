import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:movie_app/features/home/domain/bloc/home_bloc.dart';
import 'package:movie_app/gen/fonts.gen.dart';
import 'package:movie_app/injection/injection.dart';
import 'package:movie_app/utils/icons/custom_icons.dart';

import 'button_see_more.dart';

@RoutePage()
class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) {
        return getIt<HomeBloc>()
          ..add(const HomeGetNowPlayingEvent.getNowPlayingFilms())
          ..add(const HomeGetPopularEvent.getPopularFilms());
      },
      child: Scaffold(
        appBar: AppBar(
          title: const Text(
            'FilmKu',
            style: TextStyle(
              fontSize: 16,
              fontFamily: FontFamily.merriweather,
              color: Color(0xFF110E47),
            ),
          ),
          centerTitle: true,
          leading: Container(
            padding: const EdgeInsets.symmetric(
              vertical: 10,
              horizontal: 15,
            ),
            child: SvgPicture.asset(
              'assets/icons/menu.svg',
              width: 16,
              height: 12,
            ),
          ),
          actions: [
            Container(
              padding: const EdgeInsets.symmetric(
                vertical: 16,
                horizontal: 20,
              ),
              child: SvgPicture.asset(
                'assets/icons/push.svg',
                width: 16,
                height: 20,
              ),
            ),
          ],
        ),
        body: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            children: [
              Row(
                children: [
                  const Text(
                    'Now Showing',
                    style: TextStyle(
                      fontFamily: FontFamily.merriweather,
                      fontSize: 16,
                      fontWeight: FontWeight.w900,
                    ),
                  ),
                  const Expanded(
                    flex: 3,
                    child: SizedBox(),
                  ),
                  buttonSeeMore()
                ],
              ),
              const SizedBox(height: 16),
              BlocConsumer<HomeBloc, HomeState>(
                listener: (context, state) {},
                builder: (context, state) {
                  // context.read<HomeBloc>();
                  return Expanded(
                    flex: 2,
                    child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: state.filmsNowPlaying.length,
                        itemBuilder: (_, index) {
                          // print('---------${state.films[index].title}--------');
                          return SizedBox(
                            width: 140,
                            height: 264,
                            child: Padding(
                              padding: const EdgeInsets.only(right: 16),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  ClipRRect(
                                    borderRadius: BorderRadius.circular(10),
                                    child: Image.network(
                                      state.filmsNowPlaying[index].image,
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
                          );
                        }),
                  );
                },
              ),
              Row(
                children: [
                  const Text(
                    'Popular',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const Expanded(
                    flex: 3,
                    child: SizedBox(),
                  ),
                  buttonSeeMore()
                ],
              ),
              BlocConsumer<HomeBloc, HomeState>(
                listener: (context, state) {
                  state.stateStatus.whenOrNull(success: (val) {
                    if (val is bool && state.filmsPopular.isNotEmpty && state.movieDetail.isEmpty) {
                      for (var e in state.filmsPopular) {
                        context.read<HomeBloc>().add(HomeGetMovieDetailsEvent.getMovieDetails(e.id));
                      }
                    }
                  });
                },
                builder: (context, state) {
                  debugPrint('olololololololo ${state.movieDetail.length} == ${state.filmsPopular.length}');
                  if (state.movieDetail.length != state.filmsPopular.length && state.filmsPopular.isNotEmpty) {
                    return const SizedBox();
                  }
                  return Expanded(
                    flex: 2,
                    child: ListView.builder(
                      itemCount: state.filmsPopular.length,
                      itemBuilder: (_, index) {
                        return SizedBox(
                          height: 140,
                          child: Padding(
                            padding: const EdgeInsets.only(bottom: 16),
                            child: Row(
                              children: [
                                ClipRRect(
                                  borderRadius: BorderRadius.circular(10),
                                  child: Image.network(
                                    state.filmsPopular[index].image,
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.symmetric(horizontal: 16),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Container(
                                        color:Colors.red ,
                                        child: SizedBox(
                                          width: MediaQuery.of(context).size.width - 170,
                                          child: Text(
                                            '${state.filmsPopular[index].title}\n',
                                            maxLines: 2,
                                            overflow: TextOverflow.ellipsis,
                                            style: const TextStyle(fontWeight: FontWeight.bold),
                                          ),
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
                                              text:
                                                  '${state.filmsPopular[index].rating.toStringAsFixed(1)}/10 IMDb',
                                              style: const TextStyle(color: Colors.grey),
                                            )
                                          ],
                                        ),
                                      ),
                                      SizedBox(
                                        width: 200,
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
                                        text: const TextSpan(
                                          children: [
                                            WidgetSpan(
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
                                              text: '1h 47m',
                                              style: TextStyle(color: Colors.grey, letterSpacing: 1),
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
                        );
                        // TODO Lists return
                      },
                    ),
                  );
                },
              ),
            ],
          ),
        ),
        bottomNavigationBar: BottomNavigationBar(
          items: [
            BottomNavigationBarItem(icon: Image.asset('assets/icons/bottom_nav1.png'), label: ''),
            const BottomNavigationBarItem(icon: Icon(CustomIcons.bottom_nav2), label: ''),
            const BottomNavigationBarItem(icon: Icon(CustomIcons.bottom_nav3), label: '')
          ],
          currentIndex: 2,
        ),
      ),
    );
  }
}
