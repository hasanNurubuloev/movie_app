import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';
import 'package:movie_app/features/home/domain/entity/cast_entity.dart';
import 'package:movie_app/features/home/domain/entity/movie_detail_entity.dart';
import 'package:movie_app/features/home/presentation/widgets/button_see_more.dart';
import 'package:movie_app/features/home/presentation/widgets/widget_list_genres.dart';
import 'package:movie_app/gen/fonts.gen.dart';

@RoutePage()
class DetailMovieScreen extends StatefulWidget {
  final MovieDetailEntity movieDetailEntity;
  final List<CastEntity> listCastEntity;

  const DetailMovieScreen(this.movieDetailEntity, this.listCastEntity, {super.key});

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
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.all(24),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    widget.movieDetailEntity.name,
                    style:
                        const TextStyle(fontSize: 20, fontFamily: FontFamily.merriweather, fontWeight: FontWeight.w700),
                  ),
                  Row(
                    children: [
                      const Icon(
                        Icons.star,
                        color: Colors.yellow,
                        size: 16,
                      ),
                      Text(
                        '${widget.movieDetailEntity.voteAverage}/10 IMDb',
                        style: const TextStyle(color: Colors.grey),
                      )
                    ],
                  ),
                  Container(
                    margin: const EdgeInsets.symmetric(vertical: 16),
                    child: ListGenresWidget(listGenres: widget.movieDetailEntity.listGenres),
                  ),
                  const Row(
                    children: [
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Length',
                              style: TextStyle(
                                color: Colors.grey,
                                fontSize: 12,
                                fontWeight: FontWeight.w400,
                                fontFamily: FontFamily.merriweather,
                              ),
                            ),
                            Text(
                              '2h 18min',
                              style: TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.w600,
                                fontFamily: FontFamily.merriweather,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Language',
                              style: TextStyle(
                                color: Colors.grey,
                                fontSize: 12,
                                fontWeight: FontWeight.w400,
                                fontFamily: FontFamily.merriweather,
                              ),
                            ),
                            Text(
                              'English',
                              style: TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.w600,
                                fontFamily: FontFamily.merriweather,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Rating',
                              style: TextStyle(
                                color: Colors.grey,
                                fontSize: 12,
                                fontWeight: FontWeight.w400,
                                fontFamily: FontFamily.merriweather,
                              ),
                            ),
                            Text(
                              'PG-13',
                              style: TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.w600,
                                fontFamily: FontFamily.merriweather,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 24),
                  const Text(
                    'Description',
                    style: TextStyle(
                      fontWeight: FontWeight.w900,
                      fontSize: 16,
                    ),
                  ),
                  Text(
                    widget.movieDetailEntity.overview,
                    style: const TextStyle(
                      color: Colors.grey,
                      fontWeight: FontWeight.w400,
                      fontSize: 12,
                    ),
                  ),
                  const SizedBox(height: 24),
                  const Row(
                    children: [
                      Text(
                        'Cast',
                        style: TextStyle(
                          fontWeight: FontWeight.w900,
                          fontSize: 16,
                        ),
                      ),
                      Spacer(),
                      ButtonSeeMore()
                    ],
                  ),
                  SizedBox(
                    // width: MediaQuery.of(context).size.width,
                    height: 112,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      // itemCount: widget.movieDetailEntity.listCast.length,
                      itemCount: 3,
                      itemBuilder: (_, index) {
                        return Container(
                          // color: Colors.red,
                          margin: const EdgeInsets.only(right: 12),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              // Container(
                              //   color: Colors.grey,
                              //   height: 30,
                              //   width: 30,
                              // ),
                              // Container(
                              //   color: Colors.yellow,
                              //   height: 30,
                              //   width: 30,
                              // ),
                              Image.network(
                                widget.listCastEntity[index].profilePath,
                                width: 72,
                                height: 72,
                              ),
                              Text(widget.listCastEntity[index].name)
                            ],
                          ),
                        );
                      },
                    ),
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
