import 'package:expenses_ekle/data/data.dart';
import 'package:flutter/material.dart';
import 'package:expenses_ekle/widgets/expense_item.dart';

class ExpenesPage extends StatefulWidget {
  const ExpenesPage({Key? key}) : super(key: key);

  @override
  _ExpenesPageState createState() => _ExpenesPageState();
}

class _ExpenesPageState extends State<ExpenesPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("GRAFİK"),
            Expanded(
              child: ListView.builder(
                itemCount: expenseList.length,
                itemBuilder: (context, index) {
                  return Card(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(
                          15.0), // Ayarlamak istediğiniz yuvarlaklık miktarı
                    ),
                    color: expenseList[index].color, // Kartın arka plan rengi
                    child: ExpenseItem(expenseList[index]),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
