import 'package:expense_tracker/widgets/expenses_list.dart';
import 'package:flutter/material.dart';

import 'package:expense_tracker/models/expense.dart';

class Expenses extends StatefulWidget {
  const Expenses({super.key});

  @override
  State<Expenses> createState() => _ExpensesState();
}

class _ExpensesState extends State<Expenses> {
  final List<Expense> _registeredExpenses = [
    Expense(
      title: "NU",
      amount: 1475900,
      category: Category.leisure,
      date: DateTime.now(),
    ),
    Expense(
      title: "Udemy Courses",
      amount: 59800,
      category: Category.work,
      date: DateTime.now(),
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Text("Chart"),
        Expanded(
          child: ExpensesList(expenses: _registeredExpenses),
        ),
      ],
    );
  }
}
