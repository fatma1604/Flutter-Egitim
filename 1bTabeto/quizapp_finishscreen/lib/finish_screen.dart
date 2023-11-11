import 'package:flutter/material.dart';

class FinishScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('OYUNUM'),
        ),
        body: Center(
          child: Text('Oyun Bitti'),
        ),
      ),
    );
  }
}
