import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tobrto_melass/models/meal.dart';
import 'package:tobrto_melass/providers/favorites_provadir.dart';

class FavoriteMealsList extends ConsumerStatefulWidget {
  @override
  ConsumerState<FavoriteMealsList> createState() => _FavoriteMealsListState();
}

class _FavoriteMealsListState extends ConsumerState<FavoriteMealsList> {
  @override
  Widget build(BuildContext context) {
    List<Meal> favorites = ref.watch(favoriteMealsProvider);
    return Scaffold(
      appBar: AppBar(
        title: Text('Favorite Meals'),
      ),
      body: ListView.builder(
        itemCount: favorites.length,
          itemBuilder: (ctx, index) => Text(favorites[index].name)),
    );
  }
}
