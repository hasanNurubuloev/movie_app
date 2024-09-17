import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/features/home/domain/bloc/home_bloc.dart';

Widget buttonSeeMore(){
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