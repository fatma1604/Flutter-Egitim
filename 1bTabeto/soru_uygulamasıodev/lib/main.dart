import 'package:flutter/material.dart';
import 'package:soru_uygulamasi_deneme/data/questions.dart';

void main(List<String> args) {
  runApp(const MaterialApp(home: Questionscreen()));
}
//yun yapma kısmına geldik onlar ödev2 de

//ben butona bastımda adam bana bi ekran çıkartsın veya bi yazı yasın isterim
class Questionscreen extends StatefulWidget {
  const Questionscreen({super.key});

  @override
  State<Questionscreen> createState() {
    return _Questionscreen();
  }
}

class _Questionscreen extends State<Questionscreen> {
  int currentQuestionIndex = 0;

  String text = "Aşağıdakilerden hangisi bir widget türüdür";

  String soru = questions[0].question;

  static get question => null;
  void changeText(String answer) {
    setState(() {
      text = answer;
    });
  }

  @override
  Widget build(BuildContext buildContext) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(questions[currentQuestionIndex].question),
            ...questions[currentQuestionIndex].answers.map((answer) {
              return ElevatedButton(
                onPressed: () {
                  changeText(answer);
                  if (currentQuestionIndex < questions.length - 1) {
                    setState(() {
                      currentQuestionIndex++;
                    });
                  } // Yeni soruya geç
                },
                child: Text(answer),
              );
            })
          ],
        ),
      ),
    );
  }
}
