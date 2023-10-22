import 'package:flutter/material.dart';

class CardGradient {
  final Color color1;
  final Color color2;

  CardGradient({required this.color1, required this.color2});
  CardGradient.from({required this.color1})
      : color2 = Color.fromARGB(128, color1.red, color1.green, color1.blue);
}
