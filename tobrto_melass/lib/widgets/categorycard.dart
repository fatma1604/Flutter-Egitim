import 'package:flutter/material.dart';
import 'package:tobrto_melass/models/category.dart';

class Categorycard extends StatelessWidget {
  final void Function() onCategoryClick;
  final Category category;

  const Categorycard(
      {Key? key, required this.onCategoryClick, required this.category})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      splashColor: category.color,
      onTap: () {
        onCategoryClick();
      },
      customBorder: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
      ),
      child: Container(
        padding: const EdgeInsets.all(25),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          gradient: LinearGradient(colors: [
            category.color.withOpacity(0.4),
            category.color.withOpacity(0.6)
          ], begin: Alignment.centerLeft, end: Alignment.center),
        ),
        child: Text(category.name),
      ),
    );
  }
}
