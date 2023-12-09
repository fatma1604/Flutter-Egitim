import 'package:flutter/material.dart';
import 'package:riverpod/screens/catagorys.dart';



final them = ThemeData(
    useMaterial3: true,
    colorScheme: ColorScheme.fromSeed(
        seedColor: Colors.purple, brightness: Brightness.dark));

void main() {
  runApp(MaterialApp(
    home: const Categories(),
    debugShowCheckedModeBanner: false,
    theme: ThemeData(
      appBarTheme: AppBarTheme(color: Colors.white),
    ),
  ));
}
