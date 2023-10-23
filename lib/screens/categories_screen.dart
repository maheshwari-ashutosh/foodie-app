import 'package:flutter/material.dart';
import 'package:foodie/model/card_gradient.dart';
import 'package:foodie/model/category.dart';
import 'package:foodie/test-data/category_test_data.dart';
import 'package:foodie/widgets/category_card.dart';

class CategoriesScreen extends StatelessWidget {
  CategoriesScreen({super.key});
  final List<Category> foodCategories = categories
      .map(
        (e) => Category(
          title: e["name"],
          gradient:
              CardGradient(color1: e["colors"][0], color2: e["colors"][1]),
        ),
      )
      .toList();

  @override
  Widget build(BuildContext context) {
    return GridView(
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 1,
        crossAxisSpacing: 8,
        mainAxisSpacing: 8,
      ),
      padding: const EdgeInsets.all(8),
      children: [
        for (final category in foodCategories) CategoryCard(category: category)
      ],
    );
  }
}
