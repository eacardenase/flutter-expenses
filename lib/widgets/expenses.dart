import 'package:flutter/material.dart';

import 'package:expense_tracker/models/expense.dart';
import 'package:expense_tracker/widgets/expenses_list/expenses_list.dart';

class Expenses extends StatefulWidget {
  const Expenses({
    super.key,
    required this.expenses,
  });

  final List<Expense> expenses;

  @override
  State<Expenses> createState() => _ExpensesState();
}

class _ExpensesState extends State<Expenses> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Text("Chart"),
        Expanded(
          child: ExpensesList(expenses: widget.expenses),
        ),
      ],
    );
  }
}
