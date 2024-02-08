//notifadır_provadır

//notifire oluşturma
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tobrto_melass/models/meal.dart';

class FavoriteMealsNotifier extends StateNotifier<List<Meal>> {
  FavoriteMealsNotifier() : super([]);

  void toggleMealFavorite(Meal meal) {
    if (state.contains(meal)) {
      state = state.where((element) => element.id != meal.id).toList();
    } else {
      state = [...state, meal];
    }
  }
}

//provadır oluşturma
final favoriteMealsProvider =
    StateNotifierProvider<FavoriteMealsNotifier, List<Meal>>((ref) {
  return FavoriteMealsNotifier();
});
