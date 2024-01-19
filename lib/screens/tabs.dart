import 'package:flutter/material.dart';
import 'package:meals_app/screens/categories.dart';
import 'package:meals_app/screens/meals.dart';

import '../models/meals.dart';

class TabScreen extends StatefulWidget {
  const TabScreen({super.key});

  @override
  State<StatefulWidget> createState() {
    return _TabScreenState();
  }
}

class _TabScreenState extends State<TabScreen> {
  int _selectPageIndex = 0;
  final List<Meal> _favoriteMeals = [];

  void _showInfoMessage(String snackBarMessage) {
    ScaffoldMessenger.of(context).clearSnackBars();
    ScaffoldMessenger.of(context)
        .showSnackBar(SnackBar(content: Text(snackBarMessage)));
  }

  void _toggleFavoriteMealStatus(meal) {
    final isExisting = _favoriteMeals.contains(meal);

    if (isExisting) {
      _favoriteMeals.remove(meal);
      _showInfoMessage('Meal is no longer in favorites');
    } else {
      _favoriteMeals.add(meal);
      _showInfoMessage('Meal added to favorites');
    }
  }

  void _selectedPage(index) {
    setState(() {
      _selectPageIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    Widget activePage =
        CategoriesScreen(onToggleFavorites: _toggleFavoriteMealStatus);
    var activePageTitle = "Categories";

    if (_selectPageIndex == 1) {
      activePage = Meals(
          title: 'Favorites',
          meals: _favoriteMeals,
          onToggleFavorites: _toggleFavoriteMealStatus);
      activePageTitle = "Favorites";
    } else {
      activePage =
          CategoriesScreen(onToggleFavorites: _toggleFavoriteMealStatus);
      activePageTitle = "Categories";
    }

    return (Scaffold(
      appBar: AppBar(
        title: Text(activePageTitle),
      ),
      body: activePage,
      bottomNavigationBar: BottomNavigationBar(
          onTap: (index) {
            _selectedPage(index);
          },
          items: const [
            BottomNavigationBarItem(
                icon: Icon(Icons.set_meal), label: "Categories"),
            BottomNavigationBarItem(icon: Icon(Icons.star), label: "Favorites")
          ]),
    ));
  }
}
