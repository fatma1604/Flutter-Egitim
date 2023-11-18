import 'package:expenses_ekle/models/expense.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';


class ExpenseItem extends StatelessWidget {
  const ExpenseItem(this.expenseList, {Key? key}) : super(key: key);

  final Expense expenseList;
  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(children: [
        Text(expenseList.name),
        Row(
          children: [
            Text(
              "₺ ${expenseList.price.toStringAsFixed(2)}",
              style: TextStyle(color: Color.fromARGB(255, 111, 3, 144)),
            ),
            const Spacer(),
            //ortalama
            Icon(CategoryIcon[expenseList.category]),
            const SizedBox(),
            Text(DateFormat.yMEd().format(expenseList.date)) //todo format date
          ],
        )
      ]),
    );
  }
}
