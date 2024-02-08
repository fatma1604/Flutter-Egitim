import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:chat/theam/them_provider.dart';

class Setinspage extends StatefulWidget {
  const Setinspage({Key? key}) : super(key: key);

  @override
  _SetinspageState createState() => _SetinspageState();
}

class _SetinspageState extends State<Setinspage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      appBar: AppBar(
        title: Text("SETTINGS"),
        backgroundColor: Colors.transparent,
        foregroundColor: Colors.grey,
        elevation: 0,
      ),
      body: Container(
        decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.secondary,
          borderRadius: BorderRadius.circular(15),
        ),
        margin: EdgeInsets.all(25),
        padding: EdgeInsets.all(16),
        child: Consumer<ThemProvider>(
          builder: (context, themProvider, child) {
            return Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("Dark mode"),
                CupertinoSwitch(
                  value: themProvider.isDarkMode,
                  onChanged: (value) {
                    themProvider.toggleTheme();
                  },
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
