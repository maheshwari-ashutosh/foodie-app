import 'package:flutter/material.dart';
import 'package:foodie/model/meal.dart';
import 'package:foodie/widgets/meal_card.dart';

class MealDetailScreen extends StatelessWidget {
  final Meal meal;

  const MealDetailScreen({
    super.key,
    required this.meal,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          meal.title,
        ),
      ),
      body: ListView(
        children: [
          Hero(
            tag: meal.id,
            child: MealCard(meal: meal, shouldPreventNavigation: true),
          ),
          const SizedBox(
            height: 16,
          ),
          const Center(
            child: Text(
              "Ingredients",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
          ),
          Center(
            child: Column(
              children: [
                for (final ingredient in meal.ingredients)
                  Text(
                    ingredient,
                    style: const TextStyle(
                      fontSize: 16,
                    ),
                  ),
              ],
            ),
          ),
          const SizedBox(
            height: 16,
          ),
          const Center(
            child: Text(
              "Steps",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              for (final step in meal.steps)
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 16, vertical: 5),
                  child: Text(
                    step,
                    style: const TextStyle(
                      fontSize: 16,
                    ),
                  ),
                ),
            ],
          ),
        ],
      ),
    );
  }
}
