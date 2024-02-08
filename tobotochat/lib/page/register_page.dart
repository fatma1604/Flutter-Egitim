import 'package:chat/service/auth/auth_service.dart';
import 'package:chat/componts/my_button.dart';
import 'package:chat/componts/my_textfild.dart';
import 'package:flutter/material.dart';


class RegisterPage extends StatelessWidget {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPwController = TextEditingController();

  void Function()? onTap;

  RegisterPage({Key? key, required this.onTap}) : super(key: key);

  void register(BuildContext context) async {
    final auth = AuthService();
    if (_passwordController.text == _confirmPwController.text) {
      try {
        await auth.signUpWithEmailAndPassword(
          _emailController.text,
          _passwordController.text,
        );
        // Başarılı kayıt işlemi
        // İsteğe bağlı olarak başarılı kayıt sonrasında başka bir işlem yapabilirsiniz.
      } catch (e) {
        showDialog(
          context: context,
          builder: (context) => AlertDialog(title: Text(e.toString())),
        );
      }
    } else {
      showDialog(
        context: context,
        builder: (context) =>
            const AlertDialog(title: Text("Passwords don't match")),
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
            text: "E-mail",
            obscurText: false,
            controller: _emailController,
          ),
          MyTexfild(
            text: "Password",
            obscurText: false,
            controller: _passwordController,
          ),
          MyTexfild(
            text: "CONFIRM PASSWORD",
            obscurText: false,
            controller: _confirmPwController,
          ),
          MyButton(buttonText: "register", onTap: () => register(context)),
          const SizedBox(
            height: 25,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              GestureDetector(
                onTap: onTap,
                child: Text("ALREADY HAVE AN ACCOUNT"),
              ),
              GestureDetector(
                onTap: onTap,
                child: const Text("LOGIN NOW"),
              ),
            ],
          ),
        ],
      ),
    );
  }
}