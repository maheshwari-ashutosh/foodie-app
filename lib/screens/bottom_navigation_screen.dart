import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:foodie/model/navigation_item.dart';
import 'package:foodie/screens/categories_screen.dart';
import 'package:foodie/screens/filters_screen.dart';
import 'package:foodie/screens/meals_screen.dart';
import 'package:foodie/utils/meals.dart';
import 'package:foodie/widgets/main_drawer.dart';

class BottomNavigationScreen extends ConsumerStatefulWidget {
  const BottomNavigationScreen({super.key});

  @override
  ConsumerState<BottomNavigationScreen> createState() =>
      _BottomNavigationScreenState();
}

class _BottomNavigationScreenState
    extends ConsumerState<BottomNavigationScreen> {
  var _selectedScreen = NavigationItem(
    index: 0,
    title: "Categories",
    screen: CategoriesScreen(),
  );

  _handleNavigate(int index) {
    final meals = ref.watch(mealsProvider);
    setState(() {
      if (index == 1) {
        _selectedScreen = NavigationItem(
          index: index,
          title: "Favorites",
          screen: MealsScreen(
            meals: meals.where((element) => element.isFavorite).toList(),
          ),
        );
        return;
      }
      _selectedScreen = NavigationItem(
        index: index,
        title: "Categories",
        screen: CategoriesScreen(),
      );
    });
  }

  _setScreen(String identifier) {
    if (identifier == "categories") {
      Navigator.of(context).pop();
      return setState(() {
        _selectedScreen = NavigationItem(
          index: 0,
          title: "Categories",
          screen: CategoriesScreen(),
        );
      });
    }
    setState(() {
      Navigator.of(context).pop();
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (screenContext) => const FilterScreen(),
        ),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: MainDrawer(onSelectTile: _setScreen),
      appBar: AppBar(
        title: Text(_selectedScreen.title),
      ),
      body: _selectedScreen.screen,
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedScreen.index,
        onTap: _handleNavigate,
        items: const [
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
