import 'package:flutter/material.dart';
import 'package:flutter_application_1/models/expense.dart';

class ExpensesPage extends StatefulWidget {
  const ExpensesPage({super.key});

  @override
  State<ExpensesPage> createState() => _ExpensesPageState();
}

class _ExpensesPageState extends State<ExpensesPage> {
  List<Expense> expenseList = [
    Expense(name: "fasulye", price: 50, dateTime: DateTime.now()),
    Expense(name: "pilav", price: 30, dateTime: DateTime.now()),
    Expense(name: "köfte", price: 80, dateTime: DateTime.now()),
    Expense(name: "fasulye", price: 50, dateTime: DateTime.now()),
    Expense(name: "pilav", price: 30, dateTime: DateTime.now()),
    Expense(name: "köfte", price: 80, dateTime: DateTime.now()),
    Expense(name: "fasulye", price: 50, dateTime: DateTime.now()),
    Expense(name: "pilav", price: 30, dateTime: DateTime.now()),
    Expense(name: "köfte", price: 80, dateTime: DateTime.now()),
    Expense(name: "fasulye", price: 50, dateTime: DateTime.now()),
    Expense(name: "pilav", price: 30, dateTime: DateTime.now()),
    Expense(name: "köfte", price: 80, dateTime: DateTime.now()),
    Expense(name: "fasulye", price: 50, dateTime: DateTime.now()),
    Expense(name: "pilav", price: 30, dateTime: DateTime.now()),
    Expense(name: "köfte", price: 80, dateTime: DateTime.now()),
    Expense(name: "fasulye", price: 50, dateTime: DateTime.now()),
    Expense(name: "pilav", price: 30, dateTime: DateTime.now()),
    Expense(name: "köfte", price: 80, dateTime: DateTime.now()),
    Expense(name: "fasulye", price: 50, dateTime: DateTime.now()),
    Expense(name: "pilav", price: 30, dateTime: DateTime.now()),
    Expense(name: "köfte", price: 80, dateTime: DateTime.now()),
    Expense(name: "fasulye", price: 50, dateTime: DateTime.now()),
    Expense(name: "pilav", price: 30, dateTime: DateTime.now()),
    Expense(name: "köfte", price: 80, dateTime: DateTime.now()),
    Expense(name: "fasulye", price: 50, dateTime: DateTime.now()),
    Expense(name: "pilav", price: 30, dateTime: DateTime.now()),
    Expense(name: "köfte", price: 80, dateTime: DateTime.now()),
    Expense(name: "fasulye", price: 50, dateTime: DateTime.now()),
    Expense(name: "pilav", price: 30, dateTime: DateTime.now()),
    Expense(name: "köfte", price: 80, dateTime: DateTime.now()),
    Expense(name: "fasulye", price: 50, dateTime: DateTime.now()),
    Expense(name: "pilav", price: 30, dateTime: DateTime.now()),
    Expense(name: "köfte", price: 80, dateTime: DateTime.now()),
    Expense(name: "fasulye", price: 50, dateTime: DateTime.now()),
    Expense(name: "pilav", price: 30, dateTime: DateTime.now()),
    Expense(name: "fasulye", price: 50, dateTime: DateTime.now()),
    Expense(name: "pilav", price: 30, dateTime: DateTime.now()),
    Expense(name: "köfte", price: 80, dateTime: DateTime.now()),
    Expense(name: "fasulye", price: 50, dateTime: DateTime.now()),
    Expense(name: "pilav", price: 30, dateTime: DateTime.now()),
    Expense(name: "köfte", price: 80, dateTime: DateTime.now()),
    Expense(name: "fasulye", price: 50, dateTime: DateTime.now()),
    Expense(name: "pilav", price: 30, dateTime: DateTime.now()),
    Expense(name: "köfte", price: 80, dateTime: DateTime.now()),
    Expense(name: "fasulye", price: 50, dateTime: DateTime.now()),
    Expense(name: "pilav", price: 30, dateTime: DateTime.now()),
    Expense(name: "köfte", price: 80, dateTime: DateTime.now()),
    Expense(name: "fasulye", price: 50, dateTime: DateTime.now()),
    Expense(name: "pilav", price: 30, dateTime: DateTime.now()),
    Expense(name: "köfte", price: 80, dateTime: DateTime.now()),
    Expense(name: "fasulye", price: 50, dateTime: DateTime.now()),
    Expense(name: "pilav", price: 30, dateTime: DateTime.now()),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Expenses App'),
        actions: [
          IconButton(
            icon: const Icon(Icons.add_alert),
            tooltip: 'Show Snackbar',
            onPressed: () {
              ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('butona tıklandı')));
            },
          ),
        ],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("grafik bölümü"),
            Expanded(
              child: ListView.builder(
                itemCount: expenseList.length,
                itemBuilder: ((context, index) {
                  return Center(child: Text(expenseList[index].name));
                }),
              ),
            ),
            Text("Bunu ben yaptım"),
          ],
        ),
      ),
    );
  }
}
