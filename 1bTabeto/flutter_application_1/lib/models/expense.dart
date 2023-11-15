import 'package:uuid/uuid.dart';

const uuid = Uuid();

class Expense {
  Expense({required this.name, required this.price, required this.dateTime})
      : id = uuid.v4();

  String id;
  String name;
  int price;
  DateTime dateTime;
}
