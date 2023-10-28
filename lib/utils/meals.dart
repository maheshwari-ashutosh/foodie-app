import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:foodie/model/meal.dart';
import 'package:foodie/test-data/meals_test_data.dart';
import 'package:foodie/utils/filter.dart';

final List<Meal> _mealsList = meals
    .map((meal) => Meal(
          categories: meal["categories"],
          title: meal["title"],
          imageUrl: meal["imageUrl"],
          ingredients: meal["ingredients"],
          steps: meal["steps"],
          duration: meal["duration"],
          complexity: meal["complexity"] == 0
              ? Complexity.easy
              : meal["complexity"] == 1
                  ? Complexity.medium
                  : Complexity.difficult,
          affordability: meal["affordability"] == 0
              ? Affordability.affordable
              : Affordability.moderate,
          isGlutenFree: meal["isGlutenFree"],
          isLactoseFree: meal["isLactoseFree"],
          isVegan: meal["isVegan"],
          isVegetarian: meal["isVegetarian"],
        ))
    .toList();

class MealsNotifier extends StateNotifier<List<Meal>> {
  MealsNotifier() : super(_getMealsList());

  setFavorite(Meal meal) {
    meal.isFavorite = true;
    state = [...state];
  }

  removeFavorite(Meal meal) {
    meal.isFavorite = false;
    state = [...state];
  }
}

final mealsProvider =
    StateNotifierProvider<MealsNotifier, List<Meal>>((ref) => MealsNotifier());

List<Meal> _getMealsList() {
  final filter = getFilter();
  return _mealsList.where((meal) {
    if (filter.isGlutenFree && !meal.isGlutenFree) return false;
    if (filter.isLactoseFree && !meal.isLactoseFree) return false;
    if (filter.isVegan && !meal.isVegan) return false;
    if (filter.isVegetarian && !meal.isVegetarian) return false;
    return true;
  }).toList();
}
