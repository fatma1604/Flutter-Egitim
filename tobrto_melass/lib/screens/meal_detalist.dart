import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tobrto_melass/models/meal.dart';
import 'package:tobrto_melass/providers/favorites_provadir.dart';

class MealDetails extends ConsumerStatefulWidget {
  final Meal meal;

  const MealDetails({
    Key? key,
    required this.meal,
  }) : super(key: key);

  @override
  ConsumerState<MealDetails> createState() => _MealDetailsState();
}

class _MealDetailsState extends ConsumerState<MealDetails> {
  @override
  Widget build(BuildContext context) {
    final fovirites = ref.watch(favoriteMealsProvider);
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.meal.name),
        actions: [
          IconButton(
            onPressed: () {
              ref
                  .read(favoriteMealsProvider.notifier)
                  .toggleMealFavorite(widget.meal);
            },
            icon: Icon(
              fovirites.contains(widget.meal)
                  ? Icons.favorite
                  : Icons.favorite_border,
              color: Colors.red,
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.network(
              widget.meal.imageUrl,
              height: 200,
              width: double.infinity,
              fit: BoxFit.cover,
            ),
            const Padding(
              padding: EdgeInsets.all(16),
              child: Text(
                "MALZEMELER:",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: widget.meal.ingredients.map((ingredient) {
                return Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 16,
                    vertical: 4,
                  ),
                  child: Text(
                    '- $ingredient',
                    style: const TextStyle(fontSize: 16),
                  ),
                );
              }).toList(),
            ),
          ],
        ),
      ),
    );
  }
}
