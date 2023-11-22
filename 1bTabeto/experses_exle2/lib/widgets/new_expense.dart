import 'package:expenses_ekle/data/data.dart';
import 'package:expenses_ekle/models/expense.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class NewExpense extends StatefulWidget {
  final Function() onExpenseAdded;
  const NewExpense({Key? key, required this.onExpenseAdded}) : super(key: key);

  @override
  _NewExpenseState createState() => _NewExpenseState();
}

class _NewExpenseState extends State<NewExpense> {
  final _expenseNameController = TextEditingController();
  final _expensePriceController = TextEditingController();
  DateTime? _selectedDate;
  Category? _selectedCategory;
  Color? color;

  final _formKey = GlobalKey<FormState>();

  void _openDatePicker() async {
    DateTime today = DateTime.now(); // 16.11.2023
    DateTime oneYearAgo = DateTime(today.year - 1, today.month, today.day);
    DateTime? selectedDate = await showDatePicker(
        context: context,
        initialDate: _selectedDate == null ? today : _selectedDate!,
        firstDate: oneYearAgo,
        lastDate: today);
    setState(() {
      _selectedDate = selectedDate;
    });
    // sync => bir satır çalışmasını bitirmeden alt satıra geçemez.
    // async => async olan satır sadece tetiklenir kod aşağıya doğru çalışmaya devam eder
  }

  void _saveForm() {
    if (_formKey.currentState!.validate()) {
      if (_selectedDate == null || _selectedCategory == null) {
        // Tarih veya kategori seçilmediğinde bir uyarı göster
        showDialog(
          context: context,
          builder: (ctx) => AlertDialog(
            title: Text('Uyarı'),
            content: Text('Lütfen tüm alanları doldurunuz.'),
            actions: <Widget>[
              TextButton(
                child: Text('Tamam'),
                onPressed: () {
                  Navigator.of(ctx).pop();
                },
              )
            ],
          ),
        );
      } else {
        final newExpense = Expense(
            name: _expenseNameController.text,
            price: double.parse(_expensePriceController.text),
            date: _selectedDate!,
            category: _selectedCategory!,
            color: color!);
        setState(() {
          expenseList.add(newExpense);
        });
        widget.onExpenseAdded();
        Navigator.pop(context);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      child: Padding(
        padding: EdgeInsets.all(12.0),
        child: Form(
          key: _formKey,
          child: Column(children: [
            TextFormField(
                controller: _expenseNameController,
                maxLength: 50,
                decoration: InputDecoration(labelText: "Harcama Adı"),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Lütfen bir harcama adı giriniz';
                  }
                  return null;
                }),
            Row(
              children: [
                Expanded(
                  child: TextFormField(
                    controller: _expensePriceController,
                    keyboardType: TextInputType.number,
                    decoration: const InputDecoration(
                        labelText: "Harcama Miktarı", prefixText: "₺"),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Lütfen bir harcama miktarı giriniz.';
                      }
                      if (double.tryParse(value) == null) {
                        return 'Lütfen geçerli bir sayı giriniz.';
                      }
                      return null;
                    },
                  ),
                ),
                IconButton(
                    onPressed: () => _openDatePicker(),
                    icon: const Icon(Icons.calendar_month)),
                // ternary operator
                Text(_selectedDate == null
                    ? "Tarih Seçiniz"
                    : DateFormat.yMd().format(_selectedDate!)),
              ],
              // String?  a
              // String => a!
            ),
            const SizedBox(
              height: 30,
            ),
            Text("Harcama Tipi Seçiniz"),
            Row(
              children: [
                Expanded(
                  child: DropdownButton(
                      value: _selectedCategory,
                      hint: Text("Seçim Yapınız"),
                      itemHeight: 48,
                      isExpanded: true,
                      alignment: Alignment.center,
                      items: Category.values.map((category) {
                        return DropdownMenuItem(
                            value: category,
                            child: Center(child: Text(category.name)));
                      }).toList(),
                      onChanged: (value) {
                        setState(() {
                          if (_selectedCategory == Category.work) {
                            color = Colors.red;
                          } else if (_selectedCategory == Category.travel) {
                            color = Color.fromARGB(255, 40, 111, 169);
                          } else if (_selectedCategory == Category.dress) {
                            color = Color.fromARGB(255, 66, 121, 231);
                          } else if (_selectedCategory == Category.food) {
                            color = Color.fromARGB(255, 42, 2, 245);
                          }
                        });
                      }),
                )
              ],
            ),
            const Spacer(),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: const Text("Kapat")),
                const SizedBox(
                  width: 12,
                ),
                ElevatedButton(
                    onPressed: () {
                      _saveForm();
                    },
                    child: Text("Ekle")),
              ],
            ),
          ]),
        ),
      ),
    );
  }
}
