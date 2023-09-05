import 'package:flutter/material.dart';
import 'package:movies_app/api/models/api_model.dart';
import 'package:movies_app/screens/more_movies_screen.dart';
import 'package:movies_app/screens/details_screen.dart';
import 'package:movies_app/screens/movies_screen.dart';
import 'package:movies_app/screens/splash_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      builder: (BuildContext context, Widget? child) {
        final MediaQueryData data = MediaQuery.of(context);
        return MediaQuery(
          data: data.copyWith(textScaleFactor: 1),
          child: child!,
        );
      },
      debugShowCheckedModeBanner: false,
      initialRoute: '/splash_screen',
      routes: {
        '/splash_screen': (context) => const SplashScreen(),
        '/movies_screen': (context) => const MoviesScreen(),
      },
    );
  }
}
