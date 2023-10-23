import 'package:flutter/material.dart';
import 'package:foodie/screens/bottom_navigation_screen.dart';
import 'package:foodie/screens/categories_screen.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        useMaterial3: true,
      ),
      home: BottomNavigationScreen(),
    );
  }
}
