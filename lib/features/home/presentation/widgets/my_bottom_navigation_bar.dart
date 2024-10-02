
import 'package:flutter/material.dart';
import 'package:movie_app/utils/icons/custom_icons.dart';

class MyBottomNavigationBar extends StatelessWidget {
  const MyBottomNavigationBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      items: [
        BottomNavigationBarItem(icon: Image.asset('assets/icons/bottom_nav1.png'), label: ''),
        const BottomNavigationBarItem(icon: Icon(CustomIcons.bottom_nav2), label: ''),
        const BottomNavigationBarItem(icon: Icon(CustomIcons.bottom_nav3), label: '')
      ],
      currentIndex: 2,
    );
  }
}