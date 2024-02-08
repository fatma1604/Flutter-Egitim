import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tobrto_melass/models/meal.dart';

final mealsProvider = Provider((ref) {
  return [
    Meal(
        id: "1",
        categoryId: "1",
        name: "Mercimek Çorbası",
        imageUrl:
            "https://cdn.yemek.com/mnresize/940/940/uploads/2014/06/mercimek-corbasi-yemekcom.jpg",
        ingredients: ["Malzeme 1", "Malzeme 2", "Malzeme 3"]),
  ];
});
//sadece okuma için değişiklik yapılmaz 