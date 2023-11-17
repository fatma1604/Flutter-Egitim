import 'package:expenses_ekle/models/expense.dart';
import 'package:expenses_ekle/widgets/expense_item.dart';
import 'package:flutter/material.dart';

class ExpensesPage extends StatefulWidget {
  final List<Expense> initialExpenseList;

  const ExpensesPage({Key? key, required this.initialExpenseList})
      : super(key: key);

  @override
  _ExpensesPageState createState() => _ExpensesPageState();
}

class _ExpensesPageState extends State<ExpensesPage> {
  List<Expense> expenseList = [];

  @override
  void initState() {
    super.initState();
    expenseList = List.from(widget.initialExpenseList);
  }

  // Update the expense list when it changes
  void updateExpenseList(List<Expense> updatedList) {
    setState(() {
      expenseList = updatedList;
    });
  }

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
            SizedBox(height: 16),
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
