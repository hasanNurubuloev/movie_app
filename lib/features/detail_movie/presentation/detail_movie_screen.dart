import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:movie_app/features/home/domain/bloc/home_bloc.dart';
import 'package:movie_app/features/home/domain/entity/movie_detail_entity.dart';

@RoutePage()
class DetailMovieScreen extends StatefulWidget {
  final MovieDetailEntity movieDetailEntity;

  const DetailMovieScreen(this.movieDetailEntity, {super.key});

  @override
  State<DetailMovieScreen> createState() => _DetailMovieScreenState();
}

class _DetailMovieScreenState extends State<DetailMovieScreen> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            flexibleSpace: Image.asset('assets/icons/image1.png'),
            // flexibleSpace: SvgPicture.asset('assets/icons/startImage.png'),
          ),
          SliverToBoxAdapter(
            child: Column(
              children: [Text(widget.movieDetailEntity.name)],
            ),
          ),
        ],
      ),
    );
  }
}
