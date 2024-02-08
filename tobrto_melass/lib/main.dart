import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tobrto_melass/screens/categoriis.dart';

void main() {
  runApp(ProviderScope(child: const MaterialApp(home: Categoriis())));
}
