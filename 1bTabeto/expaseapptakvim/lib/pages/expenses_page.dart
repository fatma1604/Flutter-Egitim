

import 'package:expaseapptakvim/models/expense.dart';
import 'package:expaseapptakvim/widgets/expense_item.dart';
import 'package:flutter/material.dart';

//fdtful hızlıcaa kod

class ExpensesPage extends StatefulWidget {
  const ExpensesPage({Key? key}) : super(key: key);

  @override
  _ExpensesPageState createState() => _ExpensesPageState();
}

class _ExpensesPageState extends State<ExpensesPage> {
  List<Expense> expenseList = [
    Expense(name: "Makarna", price: 80.55, date: DateTime.now()),
    Expense(name: "Pilav", price: 70.77, date: DateTime.now()),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Your Expenses",
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Colors.deepPurple,
              ),
            ),
            SizedBox(height: 16), // Add some vertical spacing
            Expanded(
              child: ListView.builder(
                itemCount: expenseList.length,
                itemBuilder: (context, index) {
                  return ExpenseItem(expenseList[index]);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
