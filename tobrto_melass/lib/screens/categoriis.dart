import 'package:flutter/material.dart';
import 'package:tobrto_melass/data/categorilist.dart';
import 'package:tobrto_melass/models/category.dart';
import 'package:tobrto_melass/providers/favorites.dart';
import 'package:tobrto_melass/screens/melas.dart';
import 'package:tobrto_melass/widgets/categorycard.dart';

class Categoriis extends StatefulWidget {
  const Categoriis({Key? key}) : super(key: key);

  @override
  State<Categoriis> createState() => _CategoriisState();
}

class _CategoriisState extends State<Categoriis> {
  void _changeScreen(Category category, BuildContext context) {
    Navigator.of(context)
        .push(MaterialPageRoute(builder: (ctx) => Melas(category: category)));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Bir Kategori Seç"),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => FavoriteMealsList()));
            },
            icon: const Icon(Icons.favorite_border),
          ),
        ],
      ),
      body: GridView(
        padding: EdgeInsets.all(10),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 20,
          mainAxisSpacing: 35,
          mainAxisExtent: 100,
          childAspectRatio: 2,
        ),
        children: [
          for (final categy in categorilist)
            Categorycard(
              onCategoryClick: () {
                _changeScreen(categy, context);
              },
              category: categy,
            )
        ],
      ),
    );
  }
}
