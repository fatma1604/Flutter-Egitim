import 'package:flutter/material.dart';

class Category {
  final String id;
  final String name;
  final Color color;

  const Category(
      {required this.id, required this.name, this.color = Colors.red});
}

class Favori {
  final String id;

  Favori({required this.id});
}
