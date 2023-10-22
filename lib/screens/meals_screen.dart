import 'package:flutter/material.dart';
import 'package:foodie/model/meal.dart';
import 'package:foodie/widgets/meal_card.dart';

class MealsScreen extends StatelessWidget {
  const MealsScreen({super.key, required this.title, required this.meals});

  final String title;
  final List<Meal> meals;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: ListView(
        children: [for (final meal in meals) MealCard(meal: meal)],
      ),
    );
  }
}
