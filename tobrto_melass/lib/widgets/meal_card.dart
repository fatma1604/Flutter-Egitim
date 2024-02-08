//yapıları kart halıne getirmek için
import 'package:flutter/material.dart';
import 'package:tobrto_melass/models/category.dart';
import 'package:tobrto_melass/models/meal.dart';
import 'package:tobrto_melass/screens/meal_detalist.dart';

class MealCard extends StatelessWidget {
  final Category category;
  final Meal meal;

  const MealCard({
    Key? key,
    required this.meal,
    required this.category,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    void toggleFavoriteMeal(Meal meal) {}
    return InkWell(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => MealDetails(meal: meal),
          ),
        );
      },
      child: Card(
        elevation: 9,
        shadowColor: Colors.grey[500],
        color: category.color,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(25)),
        child: Padding(
          padding: EdgeInsets.all(16),
          child: Text(meal.name),
        ),
      ),
    );
  }
}
