import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod/data/dummy_data.dart';
import 'package:riverpod/models/catagory.dart';
import 'package:riverpod/models/meal.dart';
import 'package:riverpod/provadis/meals_provadir.dart';
import 'package:riverpod/widgets/meal_card.dart';

class Meals extends ConsumerWidget {
  const Meals({Key? key, required this.category}) : super(key: key);
  final Category category;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    List<Meal> mealsFromState = ref.watch(mealsProvider);
    List<Meal> meals =
        mealList.where((element) => element.categoryId == category.id).toList();

    Widget widget = ListView.builder(
        itemCount: meals.length,
        itemBuilder: (ctx, index) => MealCard(meal: meals[index]));

    if (meals.isEmpty) {
      widget = const Center(
        child: Text("Bu kategoride hiç bir tarif bulunamadı.."),
      );
    }

    return Scaffold(
      appBar: AppBar(title: Text(category.name)),
      body: widget,
    );
  }
}
