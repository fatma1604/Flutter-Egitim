import 'package:flutter/material.dart';
import 'package:kasimsekizodev/home_screen.dart';
import 'package:kasimsekizodev/quiz_screen.dart';

class SwiperScreen extends StatefulWidget {
  const SwiperScreen({Key? key}) : super(key: key);

  @override
  _SwiperScreenState createState() => _SwiperScreenState();
}

// callback function
class _SwiperScreenState extends State<SwiperScreen> {
  String activeScreenName = "home-screen";

  void goToQuiz() {
    print("basıldı");
    setState(() {
      activeScreenName = "quiz-screen";
    });
  }

  // StatefullWidget setState her yapıldığında build fonksiyonunu yeniden çalıştırır.
  @override
  Widget build(BuildContext context) {
    Widget activeScreen = HomeScreen(goToQuiz); //

    if (activeScreenName == "quiz-screen") activeScreen = QuizView();

    return Container(
      child: activeScreen,
    );
  }
}

