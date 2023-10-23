import 'package:foodie/model/meal.dart';
import 'package:foodie/test-data/meals_test_data.dart';

final List<Meal> mealsList = meals
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

List<Meal> getMealsList() {
  return mealsList;
}
