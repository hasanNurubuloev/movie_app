import 'package:flutter/material.dart';
import 'package:movie_app/core/app/app.dart';
import 'package:movie_app/features/home/presentation/home_screen.dart';
import 'package:movie_app/injection/injection.dart';

void main() async {
  await configureDepencies();
  runApp(const MyApp());
}



