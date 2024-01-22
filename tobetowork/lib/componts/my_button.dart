import 'package:flutter/material.dart';

class MyButton extends StatelessWidget {
  final String buttonText;
  final void Function()? onTap;

  const MyButton({
    Key? key,
    required this.buttonText,
    this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          color: Colors.deepPurple.shade700,
          borderRadius: BorderRadius.circular(8.0),
        ),
        padding: const EdgeInsets.symmetric(
          horizontal: 145.0,
          vertical: 20.0,
        ), // İhtiyaca göre padding ayarlayın
        child: Text(
          buttonText, // widget'tan buttonText'ı kullanın
          style: TextStyle(color: Colors.white),
        ),
      ),
    );
  }
}
