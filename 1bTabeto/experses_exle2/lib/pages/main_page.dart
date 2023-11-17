import 'package:expenses_ekle/models/expense.dart';
import 'package:expenses_ekle/pages/expenses_page.dart';
import 'package:expenses_ekle/widgets/new_expense.dart';
import 'package:flutter/material.dart';

class MainPage extends StatefulWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  List<Expense> _expensesList = [];

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
                  return NewExpense(
                    onExpensesUpdated: (expenses) {
                      setState(() {
                        _expensesList.addAll(expenses);
                      });
                    },
                  );
                },
              );
            },
            icon: const Icon(Icons.add),
          )
        ],
      ),
      body: ExpensesPage(
        initialExpenseList: _expensesList,
      ),
      backgroundColor: Colors.grey[200],
    );
  }
}
