import 'package:flutter/material.dart';

import 'package:expense_tracker/models/expense.dart';
import 'package:expense_tracker/widgets/expense_item.dart';

class ExpensesList extends StatelessWidget {
  const ExpensesList({
    super.key,
    required this.expenses,
  });

  final List<Expense> expenses;

  @override
  Widget build(BuildContext context) {
    // better alternative to columns if children widgets length get long
    // all column's children get rendered/created once the build method runs
    return ListView.builder(
      itemCount: expenses.length,
      scrollDirection: Axis.vertical,
      itemBuilder: (context, index) => ExpenseItem(
        expense: expenses[index],
      ),
    );
  }
}
