import 'package:expaseapptakvim/models/expense.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';


class ExpenseItem extends StatelessWidget {
  const ExpenseItem(this.expenseList, {Key? key}) : super(key: key);

  final Expense expenseList;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 3, // Add some elevation for a shadow effect
      margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 16), // Add margin for spacing

      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              expenseList.name,
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 8), // Add some vertical spacing

            Row(
              children: [
                Text(
                  "₺ ${expenseList.price.toStringAsFixed(2)}",
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.green, // Customize the text color
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const Spacer(),
                Text(
                  DateFormat.yMEd().format(expenseList.date),
                  style: TextStyle(
                    fontSize: 14,
                    color: Colors.grey, // Customize the text color
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
