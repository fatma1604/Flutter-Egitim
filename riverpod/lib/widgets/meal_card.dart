import 'package:flutter/material.dart';
import 'package:riverpod/models/meal.dart';
import 'package:riverpod/screens/meal_datais.dart';

class MealCard extends StatelessWidget {
  const MealCard({super.key, required this.meal});
  final Meal meal;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.of(context)
            .push(MaterialPageRoute(builder: (ctx) => MealDetails(meal: meal)));
      },
      child: Card(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(meal.name),
        ),
      ),
    );
  }
}
