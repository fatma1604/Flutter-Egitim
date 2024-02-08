import 'package:chat/service/auth/auth_service.dart';
import 'package:chat/componts/my_button.dart';
import 'package:chat/componts/my_textfild.dart';
import 'package:flutter/material.dart';

// Assuming MyTextField is the correct name

class LoginPage extends StatelessWidget {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  final void Function()? onTap;

  LoginPage({Key? key, required this.onTap}) : super(key: key);

  void login(BuildContext context) async {
    final authService = AuthService(); // Corrected typo in the class name
    try {
      await authService.signInWithEmailAndPassword(
        _emailController.text,
        _passwordController.text,
      );
    } catch (e) {
      // ignore: use_build_context_synchronously
      showDialog(
        context: context,
        builder: (context) => AlertDialog(title: Text(e.toString())),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.deepPurple.shade100,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          MyTexfild(
            // Corrected the widget name
            text: "E-mail",
            obscurText: false,
            controller: _emailController,
          ),
          MyTexfild(
            // Corrected the widget name
            text: "Password",
            obscurText: true,
            controller: _passwordController,
          ),
          MyButton(
            buttonText: "login",
            onTap: () => login(context),
          ),
          const SizedBox(
            height: 25,
          ),
          GestureDetector(
            onTap: onTap,
            child: const Text("Kayıt ol"),
          ),
        ],
      ),
    );
  }
}