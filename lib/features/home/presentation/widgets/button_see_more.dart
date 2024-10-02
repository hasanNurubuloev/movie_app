import 'package:flutter/material.dart';

class ButtonSeeMore extends StatelessWidget {
  const ButtonSeeMore({super.key});

  @override
  Widget build(BuildContext context) {
    return  SizedBox(
      height: 28,
      child: TextButton(
          onPressed: () {},
          style: ButtonStyle(
              shape: WidgetStateProperty.all<RoundedRectangleBorder>(RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(100), side: const BorderSide(color: Colors.grey)))),
          child: const Text(
            'See more',
            style: TextStyle(fontSize: 10, color: Colors.grey),
          )),
    );
  }
}
