import 'package:flutter/material.dart';
import 'package:xo_game/board.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key}); 

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "XO",
      routes: {Board.routeName: (context) => const Board()},
      initialRoute: Board.routeName,
    );
  }
}
