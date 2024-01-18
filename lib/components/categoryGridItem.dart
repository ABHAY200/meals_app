import 'package:flutter/material.dart';
import 'package:meals_app/models/category.dart';

class CategoryGridItem extends StatelessWidget {
  const CategoryGridItem(
      {super.key,
      required this.categoryItem,
      required this.onSelectCategoryItem});
  final Category categoryItem;
  final void Function() onSelectCategoryItem;

  @override
  Widget build(BuildContext context) {
    return InkWell(
        onTap: onSelectCategoryItem,
        splashColor: Theme.of(context).primaryColor,
        borderRadius: BorderRadius.circular(16),
        child: Container(
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
              gradient: LinearGradient(colors: [
            categoryItem.color.withOpacity(0.55),
            categoryItem.color.withOpacity(0.95)
          ], begin: Alignment.topLeft, end: Alignment.bottomRight)),
          child: Text(
            categoryItem.title,
            style: Theme.of(context)
                .textTheme
                .titleLarge!
                .copyWith(color: Theme.of(context).colorScheme.onBackground),
          ),
        ));
  }
}
