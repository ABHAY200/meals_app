import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meals_app/models/meals.dart';

class FavoriteMealsCubit extends Cubit<List<Meal>> {
  FavoriteMealsCubit() : super([]);

  void onToggleFavoriteMeal(Meal meal) {
    final List<Meal> favoriteList = [...state];
    final isExisting = favoriteList.contains(meal);

    if (isExisting) {
      favoriteList.remove(meal);
    } else {
      favoriteList.add(meal);
    }
    emit(favoriteList);
  }
}
