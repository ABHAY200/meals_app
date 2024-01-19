import 'package:flutter/material.dart';
import 'package:meals_app/components/mealItem.dart';

import 'package:meals_app/models/meals.dart';
import 'package:meals_app/screens/mealsDetails.dart';

class Meals extends StatelessWidget {
  const Meals(
      {super.key,
      required this.title,
      required this.meals,
      required this.onToggleFavorites});
  final List<Meal> meals;
  final String title;
  final void Function(Meal meal) onToggleFavorites;

  void onTapMenuItem(BuildContext context, Meal mealsItem) {
    Navigator.of(context).pop();
    Navigator.of(context).push(MaterialPageRoute(
        builder: (ctx) => MealsDetails(
              title: mealsItem.title,
              meal: mealsItem,
              onToggleFavorites: onToggleFavorites,
            )));
  }

  @override
  Widget build(BuildContext context) {
    Widget content = Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            'Uh oh ... nothing here!',
            style: Theme.of(context).textTheme.headlineLarge!.copyWith(
                  color: Theme.of(context).colorScheme.onBackground,
                ),
          ),
          const SizedBox(height: 16),
          Text(
            'Try selecting a different category!',
            style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                  color: Theme.of(context).colorScheme.onBackground,
                ),
          ),
        ],
      ),
    );

    if (meals.isNotEmpty) {
      content = ListView.builder(
        itemCount: meals.length,
        itemBuilder: (ctx, index) => MealItem(
            mealItem: meals[index],
            onTapMenuItem: () {
              onTapMenuItem(context, meals[index]);
            }),
      );
    }

    return Scaffold(
      body: content,
    );
  }
}
