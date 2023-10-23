import 'package:flutter/material.dart';
import 'package:foodie/model/category.dart';
import 'package:foodie/screens/meals_screen.dart';
import 'package:foodie/utils/meals.dart';

class CategoryCard extends StatelessWidget {
  const CategoryCard({super.key, required this.category});

  final Category category;

  void _selectCategory(BuildContext context) {
    final mealList = getMealsList()
        .where((element) => element.categories.contains(category.title))
        .toList();
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (screenContext) {
          return MealsScreen(
            title: category.title,
            meals: mealList,
          );
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(12),
      splashColor: category.gradient.color2.withAlpha(100),
      onTap: () {
        _selectCategory(context);
      },
      child: Card(
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            boxShadow: const [
              BoxShadow(
                color: Colors.black12,
                offset: Offset(4, 4),
              ),
            ],
            gradient: LinearGradient(
              begin: AlignmentDirectional.topStart,
              end: AlignmentDirectional.bottomEnd,
              colors: [
                category.gradient.color1,
                category.gradient.color2,
              ],
            ),
          ),
          child: Center(
            child: Text(
              category.title,
              style: const TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 16,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
