import 'package:flutter/material.dart';
import 'package:introapp/models/question_model.dart';

class FinishScreen extends StatelessWidget {
  final List<String> userAnswers;
  final List<QuestionModel> questions;

  FinishScreen({required this.userAnswers, required this.questions});

  int correctCount = 0;
  int wrongCount = 0;

  int calculateCorrectResult(
      List<QuestionModel> questions, List<String> userAnswers) {
    for (int i = 0; i < questions.length; i++) {
      if (questions[i].correctAnswer == userAnswers[i]) {
        correctCount++;
      }
    }
    return correctCount;
  }

  int calculateWrongResult(
      List<QuestionModel> questions, List<String> userAnswers) {
    for (int i = 0; i < questions.length; i++) {
      if (questions[i].correctAnswer != userAnswers[i]) {
        wrongCount++;
      }
    }
    return wrongCount;
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text(
            ' Quiz Bitti',
            style: TextStyle(
                fontSize: 45,
                color: Color.fromARGB(255, 233, 6, 6),
                fontWeight: FontWeight.bold),
          ),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "cevaplarınız",
                style: TextStyle(
                    fontSize: 55,
                    color: Color.fromARGB(255, 179, 68, 68),
                    fontWeight: FontWeight.bold),
              ),
              for (int i = 0; i < userAnswers.length; i++)
                Text(
                  'Soru ${i + 1}: => Cevap: ${userAnswers[i]}',
                  style: TextStyle(
                    fontSize: 25.0,
                    color: Colors.black,
                  ),
                ),
              Text(
                  "Toplam Doğru Sayınız: ${calculateCorrectResult(questions, userAnswers)}",
              style: TextStyle(
                fontSize: 15,
                color: Color.fromARGB(255, 6, 233, 97),
                fontWeight: FontWeight.bold),
                  
                  ),
              Text(
                  "Toplam Yanlış Sayınız: ${calculateWrongResult(questions, userAnswers)}",
                  style: TextStyle(
                fontSize: 15,
                color: Color.fromARGB(255, 233, 67, 6),
                fontWeight: FontWeight.bold),),
                   Text("Toplam Soru Sayısı: ${questions.length}",style:
                    TextStyle(
                fontSize: 15,
                color: Color.fromARGB(255, 6, 59, 233),
                fontWeight: FontWeight.bold),)
            ],
          ),
        ),
      ),
    );
  }
}
