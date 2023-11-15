import 'package:expaseapptakvim/pages/expenses_page.dart';
import 'package:expaseapptakvim/widgets/new_expense.dart';
import 'package:flutter/material.dart';


class MainPage extends StatefulWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Expense App"),
        backgroundColor: Colors.deepPurpleAccent,
        actions: [
          IconButton(
            onPressed: () {
              showModalBottomSheet(
                context: context,
                builder: (ctx) {
                  return NewExpense();
                },
              );
            },
            icon: const Icon(Icons.add),
          )
        ],
      ),
      body: const ExpensesPage(),
      backgroundColor: Colors.grey[200], // Set the background color of the page
    );
  }
}