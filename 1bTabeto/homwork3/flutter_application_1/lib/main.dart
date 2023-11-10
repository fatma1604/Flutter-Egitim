import 'package:flutter/material.dart';

void main(List<String> args) {
  runApp(const MaterialApp(home: HomeScreen()));
}

//colum çalışması yapalım
//birden fazla şey ekleye bilirsin
class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});
  Widget build(BuildContext buildContext) {
    return Scaffold(
        backgroundColor: Color.fromARGB(255, 215, 170, 36),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "Fatma Nur Kamis1",
                style: TextStyle(
                    fontSize: 45,
                    color: Color.fromARGB(255, 233, 6, 6),
                    fontWeight: FontWeight.bold),
              ),
              Image.asset(
                "assets/images/fatma.jpg",
              ),
              Text(
                "05.11.2023",
                style: TextStyle(
                    fontSize: 45,
                    color: Color.fromARGB(255, 233, 6, 6),
                    fontWeight: FontWeight.bold),
              ),
              Text(
                "1B TOBETO",
                style: TextStyle(
                    fontSize: 45,
                    color: Color.fromARGB(255, 233, 6, 6),
                    fontWeight: FontWeight.bold),
              ),
            ],
          ),
        ));
  }
}
