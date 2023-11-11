import 'package:flutter/material.dart';
import 'package:introapp/data/questions.dart';
import 'package:introapp/finish_screen.dart';
import 'package:introapp/home_screen.dart';
import 'package:introapp/quiz_screen.dart';

class SwiperScreen extends StatefulWidget {
  const SwiperScreen({Key? key}) : super(key: key);

  @override
  _SwiperScreenState createState() => _SwiperScreenState();
}

// callback function
class _SwiperScreenState extends State<SwiperScreen> {
  String activeScreenName = "home-screen"; //hafızada tutulan bir değişken
  List<String> userAnswers = [];

  void goToQuiz() {
    setState(() {
      if (userAnswers.length < questions.length) {
        activeScreenName = "quiz-screen";
      } else {
        activeScreenName = "finish-screen";
      }
    });
  }

  void addAnswer(String answer) {
    userAnswers.add(answer);
    print("Listeye yeni cevap eklendi:");
    print(userAnswers);
    if (userAnswers.length >= questions.length) {
      // Kullanıcı tüm soruları cevapladıysa, FinishScreen'e geç
      goToFinishScreen();
    }
  }

  void goToFinishScreen() {
    setState(() {
      activeScreenName = "finish-screen";
    });
  }

  // StatefullWidget setState her yapıldığında build fonksiyonunu yeniden çalıştırır.
  @override
  Widget build(BuildContext context) {
    Widget activeScreen = HomeScreen(goToQuiz);

    if (activeScreenName == "quiz-screen") {
      activeScreen = QuizScreen(
        chooseAnswer: (answer) => addAnswer(answer),
      );
    } else if (activeScreenName == "finish-screen") {
      activeScreen =
          FinishScreen(userAnswers: userAnswers, questions: questions);
    }

    return Container(
      child: activeScreen,
    );
  }
}
