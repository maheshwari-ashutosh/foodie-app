import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:foodie/model/meal.dart';
import 'package:foodie/utils/meals.dart';
import 'package:foodie/widgets/meal_card.dart';

class MealsScreen extends ConsumerWidget {
  const MealsScreen({super.key, this.title, required this.meals});

  final String? title;
  final List<Meal> meals;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final bodyContent = ListView(
      children: [
        for (final meal in meals)
          Hero(
            tag: meal.id,
            key: ValueKey(meal.id),
            child: MealCard(meal: meal),
          ),
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
