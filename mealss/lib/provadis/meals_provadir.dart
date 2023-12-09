import 'package:riverpod/models/meal.dart';
import 'package:riverpod/riverpod.dart';

final mealProvider = Provider((ProviderReference ref) {
  return [
    Meal(
      id: "2",
      categoryId: "4",
      name: "Katmer",
      imageUrl:
          "https://gulumoglubaklava.com.tr/wp-content/uploads/292c2709-1626-4278-8589-fd456ae44468.jpg",
      ingredients: ["Malzeme 1", "Malzeme 2", "Malzeme 3"],
    ),
  ];
});
