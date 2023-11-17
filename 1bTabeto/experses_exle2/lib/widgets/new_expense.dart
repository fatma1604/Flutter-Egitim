import 'package:expenses_ekle/models/expense.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class NewExpense extends StatefulWidget {
  const NewExpense({Key? key}) : super(key: key);

  @override
  _NewExpenseState createState() => _NewExpenseState();
}

class _NewExpenseState extends State<NewExpense> {
  var _expenseNameController = TextEditingController();
  var _expensePriceController = TextEditingController();
  DateTime? _selectedDate;
  Category _selecetedCategory = Category.work;

  void _openDatePicker() async {
    DateTime today = DateTime.now();
    DateTime oneYearAgo = DateTime(today.year - 1, today.month, today.day);
    /*showDatePicker(
      //bekleömek zorunda değilim
            context: context,
            initialDate: today,
            firstDate: oneYearAgo,
            lastDate: today)
        .then((value) {
          //asetron işlemde nezaman cevap gelirae bu bulok çalışır
      print(value);
    });
    */
    //async function => await etmek
    //bekleme zorunda oldum
    DateTime? selectedDate = await showDatePicker(
        context: context,
        initialDate: _selectedDate == null ? today : _selectedDate!,
        firstDate: oneYearAgo,
        lastDate: today);
    setState(() {
      _selectedDate = selectedDate;
    });

    //senkron=> bir satır çalısmasını bitirmeden alt satıra geçmez.
    //asejron=async olan sadece terilenir kod aşaya doğru çalışmaya devam eder
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      child: Padding(
        padding: EdgeInsets.all(12.0),
        child: Column(children: [
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
                      labelText: "Harcama Miktarı", prefixText: "₺"),
                ),
              ),
              IconButton(
                  onPressed: () => _openDatePicker(),
                  icon: const Icon(Icons.calendar_month)),
              //ternary operator
              Text(_selectedDate == null
                  ? "Tarih seçiniz "
                  : DateFormat.yMd().format(_selectedDate!)),
            ],
          ),
          const SizedBox(
            height: 30,
          ),
          Row(
            children: [
              DropdownButton(
                  value: _selecetedCategory,
                  items: Category.values.map((Category) {
                    return DropdownMenuItem(
                        value: Category, child: Text(Category.name));
                  }).toList(),
                  onChanged: (value) {
                    setState(() {
                      if (value != null) _selecetedCategory = value;
                    });
                  })
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: const Text("kapat ")),
              const SizedBox(
                width: 12,
              ),
              ElevatedButton(
                  onPressed: () {
                    print(
                        "Kaydedilen değer: ${_expenseNameController.text} ${_expensePriceController.text}");
                  },
                  child: Text("Ekle")),
            ],
          )
        ]),
      ),
    );
  }
}
