import 'package:expenseapp/models/exepense.dart';
import 'package:flutter/material.dart';

class ExpensesPage extends StatefulWidget {
  const ExpensesPage({Key? key}) : super(key: key);

  @override
  _ExpensesPageState createState() => _ExpensesPageState();
}

class _ExpensesPageState extends State<ExpensesPage> {
  List<Expense> expenses = [
    Expense(name: "Yemek", price: 500, date: DateTime.now()),
    Expense(name: "Udemy Kursu", price: 200, date: DateTime.now()),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Expenses App'),
        actions: [
          IconButton(
            icon: const Tooltip(
              message: "Listeye Ekle",
              child: Icon(Icons.add),
            ),
            onPressed: () {
              //Henuz hazır degil
            },
          )
        ],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("grafik bölümü"),
            Expanded(
              child: ListView.builder(
                itemCount: expenses.length,
                itemBuilder: ((context, index) {
                  return Text(expenses[index].name);
                }),
              ),
            )
          ],
        ),
      ),
    );
  }
}
