import 'package:flutter/material.dart';

class Player {
  Player({required this.name, required this.op, required this.color});
  final String name;
  final String op;
  final Color color;
  int score = 0;
}
