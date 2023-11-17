import 'package:expenses_ekle/models/expense.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class NewExpense extends StatefulWidget {
  final Function(List<Expense>) onExpensesUpdated;

  const NewExpense({Key? key, required this.onExpensesUpdated}) : super(key: key);

  @override
  _NewExpenseState createState() => _NewExpenseState();
}

class _NewExpenseState extends State<NewExpense> {
  var _expenseNameController = TextEditingController();
  var _expensePriceController = TextEditingController();
  DateTime? _selectedDate;
  Category _selectedCategory = Category.work;

  void _openDatePicker() async {
    // ... (your existing code for opening date picker)
  }

  void _addExpense() {
    String name = _expenseNameController.text;
    double price = double.tryParse(_expensePriceController.text) ?? 0.0;
    DateTime date = _selectedDate ?? DateTime.now();
    Category category = _selectedCategory;

    Expense newExpense = Expense(
      name: name,
      price: price,
      date: date,
      category: category,
    );

    // Use the callback to update the expenses list in ExpensesPage
    widget.onExpensesUpdated([newExpense]);

    // Clear the text fields
    _expenseNameController.clear();
    _expensePriceController.clear();
    _selectedDate = null;

    // Close the bottom sheet
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      child: Padding(
        padding: EdgeInsets.all(12.0),
        child: Column(
          children: [
            TextField(
              controller: _expenseNameController,
              maxLength: 50,
              decoration: InputDecoration(labelText: "Harcama Adı"),
            ),
            Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: _expensePriceController,
                    keyboardType: TextInputType.number,
                    decoration: const InputDecoration(
                      labelText: "Harcama Miktarı",
                      prefixText: "₺",
                    ),
                  ),
                ),
                IconButton(
                  onPressed: () => _openDatePicker(),
                  icon: const Icon(Icons.calendar_today),
                ),
                Text(
                  _selectedDate == null
                      ? "Tarih Seçiniz"
                      : DateFormat.yMd().format(_selectedDate!),
                ),
              ],
            ),
            Row(
              children: [
                DropdownButton(
                  value: _selectedCategory,
                  items: Category.values.map((category) {
                    return DropdownMenuItem(
                      value: category,
                      child: Text(category.toString().split('.').last),
                    );
                  }).toList(),
                  onChanged: (value) {
                    setState(() {
                      if (value != null) _selectedCategory = value;
                    });
                  },
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: const Text("İptal"),
                ),
                SizedBox(width: 12),
                ElevatedButton(
                  onPressed: _addExpense,
                  child: Text("Ekle"),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

