
import 'package:flutter/material.dart';
import 'package:movie_app/features/home/presentation/widgets/button_see_more.dart';
import 'package:movie_app/gen/fonts.gen.dart';

class SliverWidgetNowPlayingTitle extends StatelessWidget {
  const SliverWidgetNowPlayingTitle({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const SliverToBoxAdapter(
      child: Row(
        children: [
          Text(
            'Now Showing',
            style: TextStyle(
              fontFamily: FontFamily.merriweather,
              fontSize: 16,
              fontWeight: FontWeight.w900,
            ),
          ),
          Expanded(
            flex: 3,
            child: SizedBox(),
          ),
          ButtonSeeMore()
        ],
      ),
    );
  }
}