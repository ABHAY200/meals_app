import 'package:flutter/material.dart';
import 'package:meals_app/data/dummy_data.dart';
import 'package:meals_app/models/category.dart';
import 'package:meals_app/screens/meals.dart';

import '../components/categoryGridItem.dart';

class CategoriesScreen extends StatelessWidget {
  const CategoriesScreen({super.key});

  void _selectedCategory(BuildContext context, Category category) {
    final selectedMeals = dummyMeals
        .where((meal) => meal.categories.contains(category.id))
        .toList();
    Navigator.of(context).push(MaterialPageRoute(
        builder: (ctx) => Meals(title: category.title, meals: selectedMeals)));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      margin: const EdgeInsets.all(10),
      child: GridView(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            childAspectRatio: 3 / 2,
            crossAxisSpacing: 16,
            mainAxisSpacing: 16),
        children: [
          for (final category in availableCategories)
            CategoryGridItem(
                categoryItem: category,
                onSelectCategoryItem: () {
                  _selectedCategory(context, category);
                })
        ],
      ),
    ));
  }
}
