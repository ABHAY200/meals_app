import 'package:flutter/material.dart';
import 'package:meals_app/models/meals.dart';

class MealsDetails extends StatelessWidget {
  const MealsDetails(
      {super.key,
      required this.title,
      required this.meal,
      required this.onToggleFavorites});

  final void Function(Meal meal) onToggleFavorites;
  final String title;
  final Meal meal;

  @override
  Widget build(BuildContext context) {
    return (Scaffold(
        appBar: AppBar(
          title: Text(title),
          actions: [
            IconButton(
                onPressed: () {
                  onToggleFavorites(meal);
                },
                icon: const Icon(Icons.star))
          ],
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              Image.network(
                meal.imageUrl,
                height: 230,
                width: double.infinity,
                fit: BoxFit.cover,
              ),
              const SizedBox(height: 14),
              Text(
                'Ingredients',
                style: Theme.of(context)
                    .textTheme
                    .titleLarge!
                    .copyWith(color: Theme.of(context).colorScheme.primary),
              ),
              const SizedBox(height: 8),
              for (final ingredient in meal.ingredients)
                Text(ingredient,
                    style: Theme.of(context).textTheme.titleMedium!.copyWith(
                        color: Theme.of(context).colorScheme.onBackground)),
              const SizedBox(height: 14),
              Text(
                'Steps',
                style: Theme.of(context)
                    .textTheme
                    .titleLarge!
                    .copyWith(color: Theme.of(context).colorScheme.primary),
              ),
              const SizedBox(height: 8),
              for (final step in meal.steps)
                Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 12,
                    vertical: 24,
                  ),
                  child: Text(step,
                      style: Theme.of(context).textTheme.titleMedium!.copyWith(
                          color: Theme.of(context).colorScheme.onBackground)),
                ),
              const SizedBox(height: 14),
            ],
          ),
        )));
  }
}
