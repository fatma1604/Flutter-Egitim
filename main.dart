import 'package:flutter/material.dart';
import 'package:flutter_application_1/result_screen.dart';
import 'package:flutter_application_1/swiper_screen.dart';

void main() {
  runApp(MaterialApp(
    home: SwiperScreen(),
    initialRoute: '/home',
    routes: {
      '/home': (context) => SwiperScreen(),
      '/result': (context) => ResultScreen(),
    },
  ));
}
