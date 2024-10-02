import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/features/home/domain/bloc/home_bloc.dart';
import 'package:movie_app/features/home/presentation/widgets/my_app_bar.dart';
import 'package:movie_app/features/home/presentation/widgets/my_bottom_navigation_bar.dart';
import 'package:movie_app/features/home/presentation/widgets/widget_list_now_playing.dart';
import 'package:movie_app/features/home/presentation/widgets/widget_sliver_list_popular.dart';
import 'package:movie_app/features/home/presentation/widgets/widget_sliver_now_playing_title.dart';
import 'package:movie_app/features/home/presentation/widgets/widget_sliver_popular_title.dart';
import 'package:movie_app/injection/injection.dart';

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
      child: const Scaffold(
        backgroundColor: Colors.white,
        appBar: MyAppBar(),
        body: Padding(
          padding: EdgeInsets.symmetric(horizontal: 24.0),
          child: CustomScrollView(
            slivers: [
              SliverWidgetNowPlayingTitle(),
              SliverToBoxAdapter(child: SizedBox(height: 16)),
              SliverWidgetListNowPlaying(),
              SliverWidgetPopularTitle(),
              SliverWidgetListPopular(),
            ],
          ),
        ),
        bottomNavigationBar: MyBottomNavigationBar(),
      ),
    );
  }
}
