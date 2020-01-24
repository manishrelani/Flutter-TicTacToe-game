import 'package:flutter/material.dart';
import 'package:tic_tac/HomePage.dart';

main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
      body: HomePage(),
    ),);
  }
}
