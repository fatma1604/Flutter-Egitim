import 'package:flutter/material.dart';

class MyTexfild extends StatelessWidget {
  final String text;
  final bool obscurText;
  final TextEditingController controller;

  const MyTexfild({
    Key? key,
    required this.text,
    required this.obscurText,
    required this.controller,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 20),
      child: TextField(
        keyboardType: text.toLowerCase() == "e-mail"
            ? TextInputType.emailAddress
            : TextInputType.text,
        autocorrect: text.toLowerCase() == "e-mail" ? false : true,
        obscureText: obscurText,
        controller: controller,
        decoration: InputDecoration(
          enabledBorder: const OutlineInputBorder(
            borderSide: BorderSide(color: Colors.deepPurple),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: Colors.deepPurple.shade600,
            ),
          ),
          fillColor: Colors.white70,
          filled: true,
          hintText: text,
          hintStyle: TextStyle(color: Colors.black26),
        ),
      ),
    );
  }
}
