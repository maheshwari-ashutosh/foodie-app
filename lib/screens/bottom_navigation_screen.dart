import 'package:flutter/material.dart';
import 'package:foodie/model/navigation_item.dart';
import 'package:foodie/screens/categories_screen.dart';
import 'package:foodie/screens/meals_screen.dart';
import 'package:foodie/test-data/meals_test_data.dart';
import 'package:foodie/utils/meals.dart';

class BottomNavigationScreen extends StatefulWidget {
  const BottomNavigationScreen({super.key});

  @override
  State<BottomNavigationScreen> createState() => _BottomNavigationScreenState();
}

class _BottomNavigationScreenState extends State<BottomNavigationScreen> {
  int _selectedIndex = 0;
  var _selectedScreen =
      NavigationItem(title: "Categories", screen: CategoriesScreen());

  _handleNavigate(int index) {
    setState(() {
      _selectedIndex = index;
      if (index == 1) {
        _selectedScreen = NavigationItem(
          title: "Favorites",
          screen: MealsScreen(
            meals: mealsList.where((element) => element.isFavorite).toList(),
          ),
        );
        return;
      }
      _selectedScreen =
          NavigationItem(title: "Categories", screen: CategoriesScreen());
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_selectedScreen.title),
      ),
      body: _selectedScreen.screen,
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        onTap: _handleNavigate,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.category),
            label: "Categories",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.star),
            label: "Favorites",
          ),
        ],
      ),
    );
  }
}
