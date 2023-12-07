import 'package:flutter/material.dart';
import 'package:sidedrawery/models/catagory.dart';
import 'package:sidedrawery/models/meal.dart';


const categoryList = [
  Category(id: "1", name: "Başlangıçlar", color: Colors.purple),
  Category(id: "2", name: "Ara Sıcaklar", color: Colors.red),
  Category(id: "3", name: "Ana Yemekler", color: Colors.blueGrey),
  Category(id: "4", name: "Tatlılar", color: Colors.limeAccent),
];

const mealList = [
  Meal(
      id: "1",
      categoryId: "1",
      name: "Mercimek Çorbası",
      imageUrl:
          "https://cdn.yemek.com/mnresize/940/940/uploads/2014/06/mercimek-corbasi-yemekcom.jpg",
      ingredients: ["Mercimek ", "Yağ", "Salça ", "Su", "Tuz"]),
  Meal(
      id: "2",
      categoryId: "4",
      name: "Patetes Köfte ",
      imageUrl:
          "https://gulumoglubaklava.com.tr/wp-content/uploads/292c2709-1626-4278-8589-fd456ae44468.jpg",
      ingredients: [
        "Patates",
        "Un",
        "Sogan",
        "Maydonoz",
        "Sarımsak",
        "Salça",
        "Tuz"
      ]),
  Meal(
      id: "3",
      categoryId: "4",
      name: "Patetes Köfte ",
      imageUrl:
          "https://gulumoglubaklava.com.tr/wp-content/uploads/292c2709-1626-4278-8589-fd456ae44468.jpg",
      ingredients: ["Pirinç", "Yağ", "Sıvı Yağ", "Su", "Tuz"]),
  Meal(
      id: "4",
      categoryId: "4",
      name: "Sufle ",
      imageUrl:
          "https://gulumoglubaklava.com.tr/wp-content/uploads/292c2709-1626-4278-8589-fd456ae44468.jpg",
      ingredients: ["Çikolata", "Süt", "Yumurta", "UN", "Tuz", "Şeker"]),
];
