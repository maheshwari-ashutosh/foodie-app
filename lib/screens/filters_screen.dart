import 'package:flutter/material.dart';
import 'package:foodie/utils/filter.dart';

class FilterScreen extends StatefulWidget {
  const FilterScreen({super.key});

  @override
  State<FilterScreen> createState() => _FilterScreenState();
}

class _FilterScreenState extends State<FilterScreen> {
  final filter = getFilter();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Filters"),
      ),
      body: Column(
        children: [
          SwitchListTile(
            value: filter.isGlutenFree,
            onChanged: (isEnabled) {
              setState(() {
                filter.isGlutenFree = isEnabled;
              });
            },
            title: Text("Gluten Free"),
            subtitle: Text("Gluten free meals"),
          ),
          SwitchListTile(
            value: filter.isVegetarian,
            onChanged: (isEnabled) {
              setState(() {
                filter.isVegetarian = isEnabled;
              });
            },
            title: Text("Vegetarian"),
            subtitle: Text("Incude Vegetarian meals"),
          ),
          SwitchListTile(
            value: filter.isVegan,
            onChanged: (isEnabled) {
              setState(() {
                filter.isVegan = isEnabled;
              });
            },
            title: Text("Vegan"),
            subtitle: Text("Incude vegan meals"),
          ),
          SwitchListTile(
            value: filter.isLactoseFree,
            onChanged: (isEnabled) {
              setState(() {
                filter.isLactoseFree = isEnabled;
              });
            },
            title: Text("Lactose Free"),
            subtitle: Text("Incude lactose free meals"),
          ),
        ],
      ),
    );
  }
}
