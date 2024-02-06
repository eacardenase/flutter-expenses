import 'package:uuid/uuid.dart';

const uuid = Uuid(); // could be reused by dart somewhere else

enum Category {
  food,
  travel,
  leisure,
  work,
}

class Expense {
  Expense({
    required this.title,
    required this.amount,
    required this.category,
    required this.date,
  }) : id = uuid.v4(); // initializer list

  final String id;
  final String title;
  final double amount;
  final Category category;
  final DateTime date;
}
