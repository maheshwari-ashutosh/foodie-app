import 'package:flutter/material.dart';
import 'package:foodie/model/meal.dart';
import 'package:foodie/widgets/meal_card.dart';

class MealsScreen extends StatelessWidget {
  const MealsScreen({super.key, this.title, required this.meals});

  final String? title;
  final List<Meal> meals;

  @override
  Widget build(BuildContext context) {
    final bodyContent = ListView(
      children: [
        for (final meal in meals) MealCard(key: ValueKey(meal.id), meal: meal)
      ],
    );
    if (title != null) {
      return Scaffold(
        appBar: AppBar(
          title: Text(title!),
        ),
        body: bodyContent,
      );
    }
    return bodyContent;
  }
}
