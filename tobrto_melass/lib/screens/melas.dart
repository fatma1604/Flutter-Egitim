import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tobrto_melass/data/meallist.dart';
import 'package:tobrto_melass/models/category.dart';
import 'package:tobrto_melass/models/meal.dart';
import 'package:tobrto_melass/providers/meals_provider.dart';
import 'package:tobrto_melass/widgets/meal_card.dart';

class Melas extends ConsumerWidget {
  const Melas({Key? key, required this.category}) : super(key: key);
  final Category category;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    List<Meal> mealsFromStare = ref.watch(mealsProvider);//provadırları okumakl için

    List<Meal> categoryMeals =
        mealList.where((meal) => meal.categoryId == category.id).toList();

    return Scaffold(
      appBar: AppBar(
        title: Text(category.name),
      ),
      body: categoryMeals.isEmpty
          ? Center(
              child: const Text("Bu kategoride hiçbir yemek bulunamadı."),
            )
          : ListView.builder(
              itemCount: categoryMeals.length,
              itemBuilder: (context, index) => MealCard(
                    meal: categoryMeals[index],
                    category: category,
                  )),
    );
  }
}
