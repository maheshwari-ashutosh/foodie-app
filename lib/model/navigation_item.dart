import 'package:flutter/material.dart';

class NavigationItem {
  NavigationItem({
    required this.index,
    required this.title,
    required this.screen,
  });

  final String title;
  final Widget screen;
  final int index;
}
