import 'package:flutter/material.dart';
import 'package:meals_app/components/mainDrawer.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:meals_app/cubit/favorite_meals_cubit.dart';
import 'package:meals_app/screens/categories.dart';
import 'package:meals_app/screens/meals.dart';

class TabScreen extends StatefulWidget {
  const TabScreen({super.key});

  @override
  State<StatefulWidget> createState() {
    return _TabScreenState();
  }
}

class _TabScreenState extends State<TabScreen> {
  int _selectPageIndex = 0;

  void _selectedPage(index) {
    setState(() {
      _selectPageIndex = index;
    });
  }

  Widget getActivePage(favoriteMealsList) {
    Widget activePage = const CategoriesScreen();
    if (_selectPageIndex == 1) {
      activePage = Meals(title: 'Favorites', meals: favoriteMealsList);
    } else {
      activePage = const CategoriesScreen();
    }
    return activePage;
  }

  String getActivePageTitle() {
    var activePageTitle = "Categories";
    if (_selectPageIndex == 1) {
      activePageTitle = "Favorites";
    } else {
      activePageTitle = "Categories";
    }
    return activePageTitle;
  }

  @override
  Widget build(BuildContext context) {
    // imported bloc pointed to a new variable
    final favoriteMealsCubit = BlocProvider.of<FavoriteMealsCubit>(context);

    return (Scaffold(
      appBar: AppBar(
        title: Text(getActivePageTitle()),
      ),
      drawer: const MainDrawer(),
      body: BlocBuilder(
        bloc: favoriteMealsCubit,
        builder: (context, favoriteMealsList) {
          return getActivePage(favoriteMealsList);
        },
      ),
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
