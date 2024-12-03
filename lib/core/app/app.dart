import 'package:flutter/material.dart';
import 'package:movie_app/core/app/router/app_router.dart';
import 'package:movie_app/injection/injection.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      routerConfig: getIt<AppRouter>().config(),
      debugShowCheckedModeBanner: false,
    );
  }
}
