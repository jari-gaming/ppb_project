import 'package:flutter/material.dart';
import 'main_screen.dart';

void main() {
  runApp(const InfoFilmApp());
}

class InfoFilmApp extends StatelessWidget {
  const InfoFilmApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'InfoFilm',
      theme: ThemeData(
        primarySwatch: Colors.pink,
        fontFamily: 'Sans',
      ),
      debugShowCheckedModeBanner: false,
      home: MainScreen(), //
    );
  }
}
