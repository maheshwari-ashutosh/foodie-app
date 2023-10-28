import 'package:flutter/material.dart';

class MainDrawer extends StatelessWidget {
  final void Function(String identifier) onSelectTile;

  const MainDrawer({super.key, required this.onSelectTile});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          const DrawerHeader(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Icon(
                  Icons.dining_outlined,
                  size: 48,
                ),
                SizedBox(
                  width: 16,
                ),
                Text(
                  "Foodie",
                  style: TextStyle(fontSize: 32),
                ),
              ],
            ),
          ),
          Column(
            children: [
              ListTile(
                title: const Text("Categories"),
                leading: const Icon(Icons.category),
                onTap: () {
                  onSelectTile("categories");
                },
              ),
              ListTile(
                title: const Text("Filter"),
                leading: const Icon(Icons.filter_alt),
                onTap: () {
                  onSelectTile("filter");
                },
              ),
            ],
          ),
        ],
      ),
    );
  }
}
