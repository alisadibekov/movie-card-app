import 'package:flutter/material.dart';
import 'package:movie_recommendation_app/display/pages/home.dart';

void main() => runApp(MainApp());

class MainApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Home(),
    );
  }
}
