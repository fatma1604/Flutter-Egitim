import 'package:expenses_ekle/models/expense.dart';
import 'package:flutter/material.dart';

List<Expense> expenseList = [
  Expense(
      name: "Alışveriş",
      price: 10000,
      date: DateTime.now(),
      category: Category.food,
      color: Color.fromARGB(255, 42, 2, 245)),
  Expense(
      name: "İş",
      price: 20000,
      date: DateTime.now(),
      category: Category.dress,
      color: Color.fromARGB(255, 66, 121, 231)),
  Expense(
      name: "Paris Gezisi",
      price: 30000,
      date: DateTime.now(),
      category: Category.travel,
      color: const Color.fromARGB(255, 40, 111, 169))
];
