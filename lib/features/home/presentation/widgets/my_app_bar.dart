import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:movie_app/gen/fonts.gen.dart';

class MyAppBar extends StatelessWidget implements PreferredSizeWidget {
  const MyAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.white,
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
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
