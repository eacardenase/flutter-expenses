import 'package:expense_tracker/models/expense.dart';

class ExpenseBucket {
  // unnamed constructor
  // const ExpenseBucket({
  //   required this.category,
  //   required this.expenses,
  // });

  final Category category;
  final List<Expense> expenses;

  // named constructor
  ExpenseBucket.forCategory(List<Expense> allExpenses, this.category)
      : expenses = allExpenses
            .where((expense) => expense.category == category)
            .toList();

  double get totalExpenses {
    double sum = 0;

    for (final expense in expenses) {
      sum += expense.amount;
    }

    return sum;
  }
}
