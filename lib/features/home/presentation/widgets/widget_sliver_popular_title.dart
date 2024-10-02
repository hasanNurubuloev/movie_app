
import 'package:flutter/material.dart';
import 'package:movie_app/features/home/presentation/widgets/button_see_more.dart';

class SliverWidgetPopularTitle extends StatelessWidget {
  const SliverWidgetPopularTitle({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      forceMaterialTransparency: true,
      backgroundColor: Colors.white,
      primary: false,
      pinned: true,
      expandedHeight: 55,
      flexibleSpace: Container(
        height: 55,
        color: Colors.white,
        child: const Center(
          child: Row(
            children: [
              Text(
                'Popular',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Expanded(
                flex: 3,
                child: SizedBox(),
              ),
              ButtonSeeMore()
            ],
          ),
        ),
      ),
    );
  }
}